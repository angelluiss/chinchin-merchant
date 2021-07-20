getUser(email, password, cb) {
    let itemKey = `user_data${email}_`
    let userData = localStorageProxy.getItem(itemKey)

    let fail = (msg, data) => {
        cb(msg || 'no-user-found', data)
    }

    let success = ({ address, mnemonic }) => {
        sessionStorageProxy.setItem('currentAddress', address)
        sessionStorageProxy.setItem('currentMnemonic', fixAccents(mnemonic))
        cb(null, { address, mnemonic })
    }

    let decrypt = (data, dcb) => {
        let key = hash.sha256().update(password).digest()
        let aesCtr = new aesjs.ModeOfOperation.ctr(key, new aesjs.Counter(5))
        let encryptedBytes = Buffer.from(data, 'hex')
        let decryptedBytes = aesCtr.decrypt(encryptedBytes)
        let decryptedText = aesjs.utils.utf8.fromBytes(decryptedBytes)

        try {
            let ob = JSON.parse(decryptedText)

            dcb(null, ob)
        } catch (e) {
            console.log('Bad local password')
            dcb(e)
        }
    }

    let store = (data) => {
        localStorageProxy.setItem(itemKey, data)
    }

    let tryLogin = () => {
        if (userData === null) {
            let husr = hash.sha256().update(email).digest('hex')
            this.axios.get(`/vexapi/user/${husr}`)
                .then((response) => {
                    if (response.status === 200) {
                        decrypt(response.data.cryptdata, (err, data) => {
                            if (err) {
                                console.log('Login challenge', response.data.challenge)
                                fail('bad-data-or-bad-password')
                            } else {
                                store(response.data.cryptdata)
                                success(data)
                            }
                        })
                    } else {
                        fail('error-request-status')
                    }
                })
                .catch(() => {
                    fail('error-request')
                })
        } else {
            decrypt(userData, (err, data) => {
                if (err) {
                    //fail('bad-data-or-bad-password')
                    userData = null
                    tryLogin()
                } else {
                    success(data)
                }
            })
        }
    }

    tryLogin()
}