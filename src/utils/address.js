var crypto = require('crypto')
var base58check = require('./base58check')

const NORMAL_PREFIX = 'M' // A

module.exports = {
  isAddress: function (address) {
    if (typeof address !== 'string') {
      return false
    }
    if (!/^[0-9]{1,20}$/g.test(address)) {
      if (!base58check.decodeUnsafe(address.slice(1, -1))) {
        console.log(111);
        return false;
      }
      if (['M'].indexOf(address[0]) == -1) {
        console.log(222);
        return false;
      }
      if(address.charAt(address.length - 1) !== 'M') {
        console.log(333);
        return false;
      }
    }
    return true
  },

  generateBase58CheckAddress: function (publicKey) {
    if (typeof publicKey === 'string') {
      publicKey = Buffer.from(publicKey, 'hex')
    }
    var h1 = crypto.createHash('sha256').update(publicKey).digest()
    var h2 = crypto.createHash('ripemd160').update(h1).digest()
    return NORMAL_PREFIX + base58check.encode(h2) + NORMAL_PREFIX;
  },
}