SELECT
'<style> table { border-collapse: collapse;}</style>'|| 
'<table cellpadding="10">'||
'<tr><td colspan="2">'||
'<img style="height:100px";  src=https://barcode.tec-it.com/barcode.ashx?data='||a.ordem||'-'||a.sub_lote||'>'||'</td> </tr>'||
'<tr><td>'||'CLIENTE:'||'</td><td>'|| c.fantasia ||'</td></tr>'||
'<tr><td>'||'ORDEM:'||'</td><td>'||a.ordem||'-'||a.sub_lote||'</td></tr>'||
'<tr><td>'||'LOTE:'||'</td><td>'||a.lote||'</td></tr>'||
'<tr><td>'||'MAQUINA:'||'</td><td>'||a.maquina||'</td></tr>'||
'<tr><td>'||'DIMENSOES:'||'</td><td>'||a.C4_ESP||'x'||a.C4_LARG ||'</td></tr>'||
'<tr><td>'||'PESO REAL:'||'</td><td>'|| round((ext_saida*ext_saida-int_saida*int_saida)*(0.000000785*31.415926535897/4*C4_LARG),0)||'</td></tr>'
||'</table>'
ETIQUETA
 FROM MCM.RELATORIO_INSPECAO a LEFT JOIN asdata.ppop b ON (a.ordem = b.codi)
                               LEFT JOIN asdata.gcliente c on (b.ccliente = c.codigo)
                               LEFT JOIN asdata.PPOPDR d ON (a.operador = d.cfunc)
        WHERE a.ORDEM =:P27_OF
        AND a.sub_lote =:P27_SUBLOTE