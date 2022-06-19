function isLetChi(string) {
    let c = 0;
    let les = 0;
    for (let k = 0; k < string.length; k++) {
        ch = string.charAt(k);
        if (isChinese(ch))
            c++;
        if (isLetter(ch))
            l++;
    }
    return (c + l ) === string.length;
}

function isChinese(temp) {
    var re = /[\u4E00-\u9FA5]/g;
    if (re.test(temp)) return false;
    return true;
}