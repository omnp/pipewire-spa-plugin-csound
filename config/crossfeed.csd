<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
;; This is just an example.

sr = 192000
ksmps = 10
nchnls_i = 2
nchnls = 2
0dbfs = 1

instr 1
ainl, ainr in
adinl delay ainl, 0.01
adinr delay ainr, 0.01
adinl tone adinl, 650.0
aidnr tone adinr, 650.0
adinl2 delay adinl, 0.045
adinr2 delay adinr, 0.045
adinl2 tone adinl2, 325.0
adinr2 tone adinr2, 325.0
af = ampdbfs(a(-6.0))
ag = ampdbfs(a(-1.5))
aoutl = adinr + af * (ainl - adinr)
aoutr = adinl + af * (ainr - adinl)
aoutl = adinr2 + ag * (aoutl - adinr2)
aoutr = adinl2 + ag * (aoutr - adinl2)
outs aoutl, aoutr
endin

</CsInstruments>
<CsScore>
i1 0 z
e
</CsScore>
</CsoundSynthesizer>
