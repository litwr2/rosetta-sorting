D=.
FN=data.js
awk -f getdata.awk $D/6502-sorting/README.md >$FN
awk -f getdata.awk $D/6809-sorting/README.md >>$FN
awk -f getdata.awk $D/Z80-sorting/README.md >>$FN
