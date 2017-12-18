/**
 * JavaScript鐨凞ateFormat绫�
 * [File  ] date.js
 * [Author] cerdar
 * [Date  ] 2006-06-20
 * copy right cerdar
/**----------------------------------------------------------------*/
function DateFormat(pattern, formatSymbols)
{
    if(pattern == null || pattern == undefined)
    {
        pattern = "yyyy-MM-dd HH:mm:ss SSS";
    }

    if(formatSymbols == null || formatSymbols == undefined)
    {
        formatSymbols = "yMdHmsS";
    }

    this.pattern = pattern;
    this.formatSymbols = formatSymbols;
}

DateFormat.prototype.format = function(date)
{
    var time = getTime(date);

    // 鏍囪瀛樺叆鏁扮粍
    var cs = this.formatSymbols.split("");

    // 鏍煎紡瀛樺叆鏁扮粍
    var fs = this.pattern.split("");

    // 鏋勯€犳暟缁�
    var ds = time.split("");

    // 鏍囧織骞存湀鏃ョ殑缁撴潫涓嬫爣
    var y = 3;
    var M = 6;
    var d = 9;
    var H = 12;
    var m = 15;
    var s = 18;
    var S = 22;

    // 閫愪綅鏇挎崲骞存湀鏃ユ椂鍒嗙鍜屾绉�
    for(var i = fs.length - 1; i > -1; i--)
    {
        switch (fs[i])
        {
            case cs[0]:
            {
                fs[i] = ds[y--];
                break;
            }
            case cs[1]:
            {
                fs[i] = ds[M--];
                break;
            }
            case cs[2]:
            {
                fs[i] = ds[d--];
                break;
            }
            case cs[3]:
            {
                fs[i] = ds[H--];
                break;
            }
            case cs[4]:
            {
                fs[i] = ds[m--];
                break;
            }
            case cs[5]:
            {
                fs[i] = ds[s--];
                break;
            }
            case cs[6]:
            {
                fs[i] = ds[S--];
                break;
            }
        }
    }

    return fs.join("");
}

/**
 *@param datetime - String
 *
 *@return - Date
 */
DateFormat.prototype.parse = function(date)
{
    var y = "";
    var M = "";
    var d = "";
    var H = "";
    var m = "";
    var s = "";
    var S = "";

    // 鏍囪瀛樺叆鏁扮粍
    var cs = this.formatSymbols.split("");

    // 鏍煎紡瀛樺叆鏁扮粍
    var ds = this.pattern.split("");

    // date   = "2005-08-22 12:12:12 888";
    // format = "yyyy-MM-dd HH:mm:ss SSS";
    // sign   = "yMdHmsS";
    var size = Math.min(ds.length, date.length);

    for(var i=0; i<size; i++)
    {
        switch (ds[i])
        {
            case cs[0]:
            {
                y += date.charAt(i);
                break;
            }
            case cs[1]:
            {
                M += date.charAt(i);
                break;
            }
            case cs[2]:
            {
                d += date.charAt(i);
                break;
            }
            case cs[3]:
            {
                H += date.charAt(i);
                break;
            }
            case cs[4]:
            {
                m += date.charAt(i);
                break;
            }
            case cs[5]:
            {
                s += date.charAt(i);
                break;
            }
            case cs[6]:
            {
                S += date.charAt(i);
                break;
            }
        }
    }

    if(y.length < 1) y = 0; else y = parseInt(y);
    if(M.length < 1) M = 0; else M = parseInt(M);
    if(d.length < 1) d = 0; else d = parseInt(d);
    if(H.length < 1) H = 0; else H = parseInt(H);
    if(m.length < 1) m = 0; else m = parseInt(m);
    if(s.length < 1) s = 0; else s = parseInt(s);
    if(S.length < 1) S = 0; else S = parseInt(S);

    var d = new Date(y, M - 1, d, H, m, s, S);

    return d;
}

// 杩斿洖褰撳墠鏃堕棿
function getTime(date)
{
    if(date == null)
    {
        date = new Date();
    }

    var y = date.getFullYear();
    var M = date.getMonth() + 1;
    var d = date.getDate();
    var h = date.getHours();
    var m = date.getMinutes();
    var s = date.getSeconds();
    var S = date.getTime()%1000;

    var html = y + "-";

    if(M < 10)
    {
        html += "0";
    }
    html += M + "-";

    if(d < 10)
    {
        html += "0";
    }
    html += d + " ";

    if(h < 10)
    {
        html += "0";
    }
    html += h + ":";

    if(m < 10)
    {
        html += "0";
    }
    html += m + ":";

    if(s < 10)
    {
        html += "0";
    }
    html += s;

    html += " ";

    if(S < 100)
    {
        html += "0"
    }

    if(S < 10)
    {
        html += "0";
    }

    html += S;

    return html;
}