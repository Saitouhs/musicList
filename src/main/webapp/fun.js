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
    return (c + l ) >= string.length;
}

function isChinese(temp) {
    var re = /[\u4E00-\u9FA5]/g;
    if (re.test(temp)) return false;
    return true;
}

function isLetter(temp) {
    var re = /[a-zA-Z]/;
    if (re.test(temp)) return false;
    return true;
}

function isDigit(temp) {
    var re = /[0-9]/;
    if (re.test(temp)) return false;
    return true;
}


function isPass(string) {
    let i = 0;
    let l = 0;
    for (let k = 0; k < string.length; k++) {
        ch = string.charAt(k);
        if (isDigit(ch))
            i++;
        if (isLetter(ch))
            l++;
    }
    return i +l >= string.length;
}
