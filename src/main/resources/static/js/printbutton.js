(function (d) {
    "function" === typeof define && define.amd ? define(["jquery", "datatables.net", "datatables.net-buttons"], function (e) {
        return d(e, window, document)
    }) : "object" === typeof exports ? module.exports = function (e, c) {
        e || (e = window);
        if (!c || !c.fn.dataTable) c = require("datatables.net")(e, c).$;
        c.fn.dataTable.Buttons || require("datatables.net-buttons")(e, c);
        return d(c, e, e.document)
    } : d(jQuery, window, document)
})(function (d, e, c) {
    var i = d.fn.dataTable, f = c.createElement("a"), l = function (a) {
        f.href = a;
        a = f.host;
        -1 === a.indexOf("/") &&
        0 !== f.pathname.indexOf("/") && (a += "/");
        return f.protocol + "//" + a + f.pathname + f.search
    };
    i.ext.buttons.print = {
        className: "buttons-print",
        text: function (a) {
            return a.i18n("buttons.print", "<i class=\"fa fa-print\"></i> 인쇄")
        },
        action: function (a, b, c, h) {
            var a = b.buttons.exportData(d.extend({decodeEntities: !1}, h.exportOptions)), c = b.buttons.exportInfo(h),
                f = function (b, c) {
                    for (var a = "<tr>", d = 0, e = b.length; d < e; d++) a += "<" + c + ">" + b[d] + "</" + c + ">";
                    return a + "</tr>"
                }, b = '<table class="' + b.table().node().className + '">';
            h.header && (b += "<thead>" + f(a.header,
                "th") + "</thead>");
            for (var b = b + "<tbody>", k = 0, i = a.body.length; k < i; k++) b += f(a.body[k], "td");
            b += "</tbody>";
            h.footer && a.footer && (b += "<tfoot>" + f(a.footer, "th") + "</tfoot>");
            var b = b + "</table>", g = e.open("", "");
            g.document.close();
            var j = "<title>" + c.title + "</title>";
            d("style, link").each(function () {
                var b = j, a = d(this).clone()[0];
                "link" === a.nodeName.toLowerCase() && (a.href = l(a.href));
                j = b + a.outerHTML
            });
            try {
                g.document.head.innerHTML = j
            } catch (m) {
                d(g.document.head).html(j)
            }
            g.document.body.innerHTML = "<h1>" + c.title + "</h1><div>" +
                (c.messageTop || "") + "</div>" + b + "<div>" + (c.messageBottom || "") + "</div>";
            d(g.document.body).addClass("dt-print-view");
            d("img", g.document.body).each(function (a, b) {
                b.setAttribute("src", l(b.getAttribute("src")))
            });
            h.customize && h.customize(g);
            setTimeout(function () {
                h.autoPrint && (g.print(), g.close())
            }, 1E3)
        },
        title: "*",
        messageTop: "*",
        messageBottom: "*",
        exportOptions: {},
        header: !0,
        footer: !1,
        autoPrint: !0,
        customize: null
    };
    return i.Buttons
});