BEGIN {
    s = ARGV[1]
    if (index(s, "6502")) s = "6502"
    else if (index(s, "6809")) s = "6809"
    else if (index(s, "Z80")) s = "Z80"
    print "var data" s " = [" 
}
/^[^|{]+\| *[0-9]+/ {
    n = 0
    f = index($0, ",")
    do {
        p = match($0, "\\| *[0-9,]+")
        if (p == 0) break;
        s = substr($0, p, RLENGTH)
        $0 = substr($0, p + RLENGTH)
        gsub("[ ,|]*", "", s)
        a[n++] = s
    } while (1);
    if (n == 5 && f == 0) {
       t = a[1]
       a[1] = a[2]
       a[2] = t + a[3]
       a[3] = a[4]
       n--
    }
    for (p = 0; p < n; p++) printf "%s, ", a[p]
    printf "\n"
}
END {
   print "0]"
}
