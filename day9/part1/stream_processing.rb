def stream_score(input)
  score = 0 # total score
  
  level = 0 # group level
  ignore = false
  garbage = false
  
  input.chars.each do |char|
    if ignore
      ignore = false
      next
    end
    
    # ---
    
    case char
      when '{'
        level += 1 unless garbage
      when '}'
        unless garbage
          score += level
          level -= 1 
        end
      when '!'
        ignore = true # ignore next character
      when '<'
        garbage = true
      when '>'
        garbage = false
    end
  end
  
  score # return score
end

# ---

i = <<-EOT.sub(/\n$/i, '')
{{{{{{{<""!>,<!<'}'ui!!!>!!!>!<{!!!!!>>},{}},{<<'"i!!a!{oe!>!!e!!!,<u!>},<a>,{<}{a",!',!!!>},<u,!!!>!}<,'!o<!>,<>}},{<!!!>'"i!!!>u!>uai!<o>,<i!!!>!>},<!>,<!>!>}o!>},<!>,<!>},<!>,<!!!>>}},{{{<!!,!!!>oo"!!a>}},{{{{<i!!!!{,!!}>}},{{{<a>},{{<a!{!!>}}}},{<!>!!i'!!!>"""!>>,{}}},{{},{{<!>'!>,e!>},<e!>},<,,{"{"!!!>'>}}},{{{{<"ao!>!!!><!>,<!!}{{!!euai>,{<{!>,<!>!>,<!"u}<!,>}},{<<!>,<!>,<<<}a!!!!a!>,<>,<!!uu!>!!!!!>!!"oe!!,o{!>},<}!>},<<!>!a!!!>>}}},{{{{<>}}},{{<!ei}"!>!!!>!!!>!!!>!>},<eu<!!<>,<"!>},<i!!!>!>},<!>,<'!!!>!!io>},{{{{<}!!!><!>},<u!!!},!!!>!>},<a,!!<'>},{<'!>,<!!>}},<<!!,au!!uu!!!>,<!!{o>},{<e}!!!>},<!!{'{eu!!,{!!aei!>,<<!!,a!!!>>}},{{<u!,>},<}{a!oei!aa,}"!!,e!>!!!>'!!}{>}}}}},{{{{<u!!!>!!i!!u!>>},<'!!!>!>},<!>,<!,>}},{<,!!!!!>,<'!a!!!>,<{!<>}}},{{{<,,'!>,<}i'!>,!>},<o<!>>},{{<!!!>!!>}}},{{<'!!>}},{{},<!>},<!>"o!>,<!!!>!!!>>}},{{<e!>},<<}{<'!>,<!!!!!>!>,<!!!<eo!!!>>,{}},{{{},<>},{{{<oi{,!!!>}!<e"<ueu!<!>>},<u!>,<!!<">},{<!!!>!>,<}!!o<<e!!oa!>,<!>,<e!!!>{>}}}}},{{{<!,!>},<u!!!>'>},{<!!"!o!!"!>o!!i>}},{{}},{{<>,<!!!!<!>},<!!!>a}i{!>ii!><>},{{<u!{!!!>!!!>},<u>,{{<}{u!,u}{>},<}!>},<ie!>,<<{u!!!<!>{">}},{}}}}},{{{{{},{}},{{<{e{!!!>i!>,<a!>uei"!!!>},<,!<}!"!!o>,{}}}},{{<>},{{<,o"i!!,!oe!>},<"}o!!!>,{i!,u>}}}},{{},{{{<<>,{}},{{{<!!a!'a}!!oeu}>}},{<!!!!!!i!>,<,'!!!>!!o>}}}},{<e<oa!!!>u!!!!!o{'!>ai>,{<e!!,!!!!!!,,i!>},<!a>}}},{{},{{<!>!>},<!!!}i<'<i<>,{<!>,<!!!>}u<i<{!>},<!!!!!>oue!>,<!!!>,<u'>,{<i!!!>},<!!ee,!>!>,<!>},<!,>}}}},{{{{<!"!!}!!!!{}!>,<!>,<!>,<!>,<!>,<!>},<'!>,<!>,<!>>},{{{{<a<!!au!>>},{<!!!>a,!!!<"'!!>}},{<ae}!>,<,'>,<!>i!}!>,<,!!'!!<!!}!,}>},{<'!!ee!!i!i>,{}}}},{}},{{{},{{{{<i!,>}}},{{<!!!>o<a{!!!>,!>eei>,{<}}!>},<<!!"!>},<a!!!>ie!>},<<!!o>}},{<!!!>!>,<!'!!!>!>},<!>},<{}ua}uuu}o>}}}},{{{<o{!!!>oe!>},<!!!>'!>,<u!!!!o!a!!!>i">,<a!>},<u"e"}!>},<{i">},{<}ui"!!!>"},!>,<!o">}},{{},{{<!!o,!>,<!>,<{io"!"e<,!!i!o}u"">},{<!>,<e!>,<'!!,'a{"!>,<"o"ui,>}}},{{<e},u}!>"!!!!,ia<!>}>,{{<!o"!>,<'o}!!!!">}}},{{{<!!!>!>!>},<>,<ao>}}},{{{},<!!!>,<!!!!!>!>},<!!!>"e!!u!'!!!>>},<!!!>},<,e!!{!}u!>>}},{{{{{},{<u<!>{<o!{<!>},<">}},{<"!>},<"!>},<!!!!!!{>,{<e!!,}!!!!>}},{{<i!!!>!!i<!!!>!!!>,<>},{{<!}!!!>e'ii<!!!!e<!!!>e"!!u!!!>>},{<a"!ii>}},{{{{}}}}}},{<<!,!!e!!!}{}!}!>},<>,<"e<!!!>},<!>i!!}{u!>},<!>,<!!!>},<"!!!>a!!!!>},{{{<e!!!>"iu!>},<!!{}{!}!!!!!>a!!,>},{<ai!>},<!>,<}}!>!!ee{!><!!!!!>!!!!,!!'!>>}},{{<ue!{e,u>},{<o}e!aai!!!>}!!i}>}}}},{{<}o!>"{!!!e!!">},{{<>},<!u!!!>!!!>},<!>},<!><>},{{},<e!!oo>}}}}},{{{<<!!!><}"uu!!i!>,!!!>,<!!i!>},<aa,!,e>,{<u>}},{<!!!!!>a<}>}},{<!<<uoe!io>,<!!!!i!>},<{ui!>},<'"u!!{>}},{{{{}},{<{!>!!!aa!ua{!>!!!>!!{{>}},{<i!""i!!!!!>''ueu}o}"!>,!!!>!!!>>,<'!!!>!>!!!>!>!i,i!i!,!oie>}}},{{<u{!!}",a!>},<oi!>!>!!!>,!!!"'!!>},{}}},{{<!!!>}}!!o>},{<{'a!!ia'o!!!>},<o!!!>},<"u>},{{{{<o}!>!!!!'{!!!!!>"!>,<>},{}}},{<!>u!"ooi!!!>!!>}}}},{{{{{{{<!>,<!>},<{!>},<!!!>},<}!>{i!>!!{!!!>!>>},{<!!!>},<!>},<!<!>},<<!u!!}iao{!!!>!!i,!>,<!}i>}},<,{!!'!!!>!!}ua>}},{{{<ou"e!!!!a!{{"!!<'!!"i>,<!!!>'u!!o!!!>},<!!!!a,o<u"}>},{<}i"uo{!>>}}}},{{{<!!!>"!!!>!!aioiii>}},{<!!!!!>!!!>!>,<e!>,<e}}"!!'i"u!>},<!u<au>,<!a!!!>a!!o!!}!o!!!{}!>!!!>a{oo!>e">},{<!>},<'!!!!!>"a'<!>!>,<o!>},<u!!"a!>"'<>,<!!a'>}},{{{},<>},{{{{{<!!!>!!a<u<e'!,"ai>},{}}},{<oio>,<!!!>,<<uo!!!!}!!!>>}},{{<!!{'!>>},<,<!><<!,>}},{{{<!>},<!!o{"!!i!>,,!>!!!>!!!e<e>},{<!!ei!!{"!>,<!!e}!",!!u,!>},<>}},{}}},{{<ia!>,<!!!>,<<o'{!!"}u!!{"<!!a>},{{<i>},{<{{'>}},{{},{<>}}}},{{<!!a!{,!>,<!>},<i!!!>,<>,{{<!!<'<}'>}}},{<}!{!>,<!>,<>,{<e{!e!>},<!!{!!!>>}},{{}}},{{<"e,!>!>{<!>!>,<a,"!!e}e>,{<<!><!!!>!auei!>},<!>>}},{<!!a"'{!"!>,<!><'e{!!<<>},{<e}!,{u{!>,<>}},{{{{{},{<!!!>,<!!!>!>,<!!!!{!!!!'{>,{{<!!i'!>},<ua!e{}}!!!>!>,<u!>>}}}}},{<!<!!!>},<i<!>},<!>,<!i{o!u''"i!>,<<!>!!!>,<>},{{<!>ea,a!>,<!><!}>},{{{<{!!{!>,<<!!!>!!!>'!!!>"{"!>!!"u'!e!>},<!!>},<}{,{>},<!>},<eio!>!!'!>,<"!o!>,<,!>,<!>i!>">},{<>,{<!>},<!>},<""!>},<!!!!!!!>!>!{!!u!!!>e!!!>"o>}}}},{{},{{<!!!>!a!!{!>},<o,!!a!!'!!!>>},<'!!i>}},{{{},{{{<e>}},{{<!!!>a,u!>},<!!o!>},<!<u}!>},<u!!!!!>!>},<'>}},{{<}!!}"!!a!!!>{iu!>!>>,<!!!!!!!>"!!,,}{}!"!!e"<i!!!!!>>}}},{{<'{o!!!!a!>{!>,<!!euou!>},<e!!!!!>,<>}}},{{},{{{<",!!i!!ea{"},>},{<!>},<!'<!!}>}}}},{{{{},{<<}!>}o!!!>!!!!!>!!a!a!>},<!>},<>}},{{{{<'>,<<u"!>,<}!'e!!!>,iao,<a">},{{<{!>},<!!>}},{{{},{}},{{{<ae!!<,{!>,<o!i<>}},{{<'!!!!!>},<'{!!!>>},{}}}}}},{<i!!!>a!!!>},<!>!>!!{i!e!u>,<io"u!>},<!>},<}a>},{{<,!>},<!!!>e<!!'!!!>},<i!!!!"!,''!!!>,!!oo>},<i!>},<'>}},{{{<!>},<!!!>!>!>,<'!!!>}}>},{<a}}!>},<e!!a!>,<!!!>!>,<>,<!!!>"!!!>!!!!!><!>},<a!!!>!>,<!>},<i""!>,<!"!!!>!"!'>}},{<!>},<!eui">,<!!}e!!!>u!{!!{!!!>},<i!>,<'o!!i!>},<!>,<>},{{<>},{{<oo'!!!i!>,<!>,<!,{{a>}}}}},{{{{{<>}},{{{{},{{<!i!>i{ua!!!>},<e!>!!{o>}}}},{<!<,!>!>},<"'!>u'!!u!!<<!!"!>}u}>},{{<!!!>}!>!!!>,<>},{},{{{{<!!!>!!!>!!!>!>a}}!>i!!!>!!uu>}},{}},{{},<>}}}},{<">,<"!>>}},{{{{},<!{!>,<!>,<!"u,!>},<>},{<!>},<a!!{{u!>},<a'!!!>i!!!>>}},{<e",!!',"aa"i{">,{<>}},{{<!!!>!>,<{!!!!!>,<>,{{<!>,<!!!>!!<!!!>,<i!>}a!!!"!!!!u{!!i>},<}!>},<}!!!!!>,<"!!!>,{",!>},<!>},<>}},{<<!!{!>,<>},{<a''}e>,{<!!!>,<!>!!"'!!!>'!!a}a''!>},<oe'>}}}},{{{<<!!!>},<!>,<"'!!!>!!!>,<'!}!!u'!!!!!><!!!>,<>,<!>,<<!>o}a>},{},{}},{{}},{{{<}">}},{{<,!>ea!!!>,{!>},!>,<{!>},<!!{}<o>},{}}}}},{},{{{{},{<"'<!>,<!!i!><a!>},<!!!,}u!>,<!o>,<>},{}},{{{<!!,!!i<'"e'"}'{ue{!!!!<!>>,{<{o<!>},<!>},<!>!{">}},{{<e!!!!!o!>i!!!>!!!>},<!!!>},<'o!!!>!>,<>},<}"a!!!!!>,<!>,<}'!>,<'"!>!>},<{<!">},{{<'!>,<ea!!a!>,<!a!!i{!>},<!>},<!!!!!!<}<>},{}}},{{{<auo'<u'io!''!!!>}!}a>,{}}},{{{{<">},<!e>},{}},{{<!!!><!>,<!!!>!!"<u}!!!!!!!>}e>,{<!!,"a>}},{<!!"aa!!,!>},<<e!>},<u!!}!>,<'a{!a>}}}},{{{<!>!o{{!!{!>,<e!<!!!!'o">,<a!"<!>eu!"i"!!'!!""!!!>},<">},{},{{<!<iu!>},<!"!>!!!><>},{<{!>!>,<!>},<o!>},<"!>,<a!!,!>oaiui!>,<>}}},{{<}!>{,!!!!!>!!!>,<u<eu!>},<,!!!>e!!!>,<!>,<>},{}}},{{{}}}},{}},{{},{{{<u'!>!!!>},<i!>'!!!>"!!<!!!>o!!!">}}}},{{{{{{<!!!i}!>},<{!!!a!!!!!!>},<",e!!!>!oe!!!>,!'o!!"!>},<>}}},{{{{{}},{{<!>,<i"a!!'!>,<!>o!>!!!>>},{<,i}{!>},<!>,<!>,<!!!><!>},<!!<a"!!!>!>,<>,{{},<ue"<o!!!!!>>}}}},{<"au!{e"!>>,<i!>},<{,i!>,<!>>}},{{<i!!!>!!!e>,<>},{<!!!!!>e{<!>,{a!!ee"!}!>,<,}e'>,<!!!>o}e!><!>!{,!>!>,<{!!!>!'}<>},{{}}},{{<!!!}io{!!ou!}eu>},{{{<oi{}!!!!!>ue!>,<a<!!e!>,<>},{{{<"!!>}}}},{}},{<i!!!>"'{ieau,{u}!!">,{<>,{}}}},{{<'!,!!!>},<}!>},<!!'!!i!i!!!!}a!!!>!>,<!!!>!!!>!>},<>},{{<!<<!!!"'','!!a<'!!!>,<"aa>},<ea}!>},<!>},<a",<i'<<!>},<">},{{<{!!!>,<!!!>,!!u!>!!a!!oai!>,<!>,<!>e}>},{<ue!>},<o",!!!>!>},<}!>,<"!!!!i!!!>!}ae{>}}}},{{{{<"o}}{!!!>,<'!!>,<!!a{!!!>>}},{<e,!!!>'u!>},<!!!!!!!!!>"!>,<>,{<!!!><!e'{e,o{""!!!>{!>{!!>}},{{{{<i!<!>!!!!!>'e!!a,}ea,i!>>},{<{!!u!ao!!!,!!{!>!!!!!!!><"}!>,<u!!!!!>,oi>}}},<i,}!!!>>}},{},{{<!!!>},<<!!ai!>},<!i!!!>,}>}},{{{{<>},{<!>},<,o!!<!!ai!!'!>},<u!>},<i<!a>}},{{<,!>}<,<!!!>"!!!!<!!!>i!!!>>},{}},{}}}}},{{<o!!!a!!!>,<>,{<!>{!!!!!><{!!u!!!!!>o!!e!'i>}}},{{{{},{<!!!>!,i!!!!!!!>!",>}},{{{<aou>}},<a!!}!!o}>},{<!>,<!!!>!!!!!>'!><u<!>,<o,!'{!!'ui!>,<>,{<{!!!>,<>}}},{{{},<!>,<!>},<!>},<ae,!!!>,<!!a!!">},{{<<}!!!!!!}!>},<<!!"'>}},{{},<!!!>},<!!oao!>,<!!a!!!>!>},<{,"o{i!!!><>}},{{{{<au!>},<a}{>,{<""!<'u'!!i>}},<!>{>}},{{{<!>o!>!!!!a!!e<!<!>!>,<!!"!>,<>},{<"!u>}}}},{{<"'!,!<!!!>!u!>,<!>,<o"!!!!ie>}}},{{{{<a,e}<!!!>},<>},{<,!ou!!!>>,{}}}},{<!!>,{{<!!u>},{{<{!>},<!>}!<ue!!!>,<e!!}>},{<<!>,<>,{}}}}}}},{}}},{{{<!!oi!!eauo>,<u<!!!>o>},{},{{<'o>,{<}!!ua'"o<e!!,>}},{{{<!!!>{}{'!!'<!!!>i{"!>e}!>a<!!!>>}}},{{},<"{!!u!!}!!<!!!>,<<!!!!!>!!!>!>!!,u,"u{>}}},{{{<,",'!!!<o,">},{}},{{{<!!!>!!!>,<<io!!!!,i"'!>,<i,!>,<{>},{}},{<!!ueu!!!>'!!>}},{{}}},{}},{{{<!>,<"{"}"oaa!!!>o",!>},<a!{'!>!!!>,<>,<!!!>!!e!!ao,>},{{{<,!!!,u<!>},<!>},<uoo<ee!!!>"o>}}},{{{<u!!!oi!!'!!!><e"e!>,<!!,,">},{}},{}}},{{},{{<a"!!'!'!!!>eo!a!>},<"!<<!>},<!u!>!>},<u!!!>>}},{{{<a!!!>!>},<!!!!!>,<>}}}},{{<{i"}!i'!!}a!!i!!{,}}'!!!'!!>,<!a>},{{{<o>}},{}}},{}}}},{{{<a!>},<<"}u!!'!>!>},<!!<>},{{},<!>},<"a!u!"">}},{}}}}},{{{<<i!!<<}a{a!>,}!!!>a!>}'>},{{{{{<}!!!>'{!!!>!!!>!>!>},<!>},<i>}},<!!a>},{{},{<>}}},{{{<u!!!o!>,<!>{>},{{},{{{{}},<",o!>!!,!>,<e"!!a,!'}!!!>a,!!!!!>>},{<,i"}>,{}}}},{{<!!!>>}}},{{<!!!>e!>ee<,!>">},{}}},{{{<!>},<!>"!!!>{u,!!!>},<<!,e>},{<!>,<!!!>{!!>}},{<<,eu,a{>,<!>!>,<"a{!!!>a!eiao{!>},<!!!!!>!!u!e!!<>},{{},<!!!>},<!!!>},<}'!!"a,e"!>!{!!!!}>}}},{{<!!ou'uuu!!!!u>},{{},{{{<!!!!!!!!!>,<"a,>}},{}}}}},{{{{{{{<<'!!!><!!!>'!>!!!>!!"!!oe}<">},{<u!!!>>}}},{{},{{{<"!>}!!,!>,<!!!>,<!!!>u"u}>}},{<!oe}!!<{!!aue>}},{<!>,<"!!!><<!<u!>,<{!e<!>,<!!!a{oa!>>,<u<!u,o,>}},{<!!!>},<!!!>i!>!!!>!!e!!ua!!"!''!!!>!,>,{<!!i{ao,{!!"a!<,{!>},<!>,}}"!!!>},<>}}},{},{{{}},<!>,<eu!>},<,!!!>!>,<'!!<!!!>},<!>,}!>},<,">}},{},{{{},{<!!!>!>>,{}}}},{{{{<!<!!}a!>},<"!>},<"e!>,<a!>,<!>,<<!>ao}>},<,e!}<!!!!a>},{},{}},{{{},<>},{<!!!{!>,<"<!>},<!!!>ea!><o,o{o,>,<!!"!!!!!>!!'!>,<"{"!!oua!>!>},<,!!!>a>}},{{{<"!!!!!!a">},<!!!!!>,<eoa!!!>>}}}},{{<<i!>"oua,{>,{<"'!>},<!>},<!>!>},<,i!,}i<>}},{{{<}!>,<o}>},<}}a!>},<!>!!!!'!e!!!>,<!>i'i>}}},{{{{<!>},<!!!ao'<ia,!!{<uu!i!>},<i{a>},{}},{{{<'!>},<o!!!><!!uo!!}!>},<u!>,<{!!!!!>aa>}}},{}},{<!>,<}eauo!>">,{<!!a<!>i<}!>"!>,<ea>,<oeii>}}}},{{{{{<"!>},<"!>},<u!>},<o!!,u!>a>},{{}},{{<!>,<!>!!!!!"!>'ii!!!!,>},<!uou}!!!>!!ea!!!>!>},<!!!!!>!!iu!!!!!>},<'!i>}}},{{{{<{!>,<'>}},{{{<i{,,!!!>},<!!!><'<,!>,<a<'u!!!!}!!">}},{{{<!<o"'!!!>},<,!>},<<>},{}},{{<""<!>,<{,!!""'e>},{{{<!>,<>,{<!!!><!!!!!>{!!!>},<>}},{}},{{}}},{{{<!!!>e!>,<!>},<}i'>}},{<iu>,{}},{}}},{{{}},<!!{"!!'!>},<!!!>},<>}},{{<a!!!>a!!!!!>!!!>!>,<<"!>,<!}u!!!>!i"o!>">},<>}}}},{{{<o'i!>ieio!>,<e>},{}}}},{{{<<ie!>,<>,<"!>,<,!>,<<'<!>,<ae!!!>,<'">},{<!!!>'a!!!>ae<!!!>!!ue,{!>!!!!!>!u>,<>},{{},{<!!"!!}!>,<<!ae!u!!<!!u!!!>o,!>>}}},{{{<e!>,<!>},<o!!!>},<ii!!!>!"!!!>>},{<a!!!!!>aa!!!!!>,<!!<'}"!>e<'>,{<!!!>,!!{i}{"!!auu,>}}},{<!>,<"o!>!><o,!!"}uo<>}}},{{<"!!!}a>,{<!!!{u!!<u!,!>!},!!!>a!!''!!!!!>{}!ao">}}},{{{{{},{{<!>,<a!>"{'"u}!{"!>,<i!>},<!>>},<!>,<!!!>'o!>'!!!>!!a<ui>},{{<{!!!!!>o!!!>,<!>},<a!i<}!>},<!!>}}}}},{},{{},{<<a"i!>},<!!!!{!!!{!>},<,!!!>o>}}}},{{{{<!>,<"!>,<{e<,!>!>,<e,!,,"!!i<<!i>,<>},{{<',}},!!'!>,<"!>},<{!i<!e{>},{<!!!>u!<}"!!!>!>!>,<!!i!>},<!!!>{'>,{<e!!eau!>},<,>}}},{{{<!!<'!!!>},<a}!!!>,<>}}}},{{<!o!!!><{i!!!>e}>,{{<<,!>,<!!!u,!>},<!i!!!i!!!>,<e!>},<i{,>}}},{<!>!>},<<u'!!!>!!}"!>},<e!>},<,!"!!!>a<!{!!!>>}}},{<}{o!e{!!!>a'!!!>e!!!!!!u!>,<!!!>},<>},{<ueo!!!!!>i!>,>,{<!!,!!ae!>,<"!!!>i!>,<'!!!!o<>}}}},{{{<>}},{{{{<u!}!>,<!!!>{!>!>},<!!!>>}},<!!!<!!!>!>!>,<i,!>,<a!!!!!>aoau}!>},<}o>},{{{<>}},{<!>},<!a,ou!!,>,<!o,}>}},{{<ou,,!e}>,{<{!!!>}}a{'u<>}}}},{{{{<!>,<!i"!!!>!!u,i!>},<!!,!>!!,!!!>,<!>>},{{},<}!!}!<!ia!!"<!>},<a!!!>!!e'>}}},{{<u!u!>},<<!>},<!!""!>!!!!i{>},{{<ia!>,<{!>!!!!!>o!!ii!!uoi!!!><ui>}}}}}},{{{{{<!>,<}>},{}}},{{{{<!>},<!>},<!aau{!u!>}!>i!!!>"ai>,{}},{{<{"!!i{'<!!!>,<>},{{{<!>!!!a'!>,<!!!>{'!!<i"eio,e,o>}},{{<!!!>,<!ae!>},<>},<!!!>!!!!e!'!!a!>,<!!!>a!>!,u!!!>i<>}},{{<!!!>'>}}},{{<!>},<''!>,<{e!>e}!}!!!>!!'!>},<!iui>}}},{{}},{{{{{<u!>},<!!a!!!u,!!!>,"!>,<!!!!"'!!u{u{>,{<!>,<!>!!!>"i,"!>},<iu!!!!e'>}},<!!u{!>},<i!!o!!"u!>,<!>,<i,<ea>},{<!!e,!!!>}!>,<}!>!ae!!uu!!!>,<>}},{<!>},<}!!!>iuaa!oa}}!!ia!>i">}},{{{<!!!>e{,o!!}!!iu'>,{{<!!!>ui!!!uau<e!>!!!>>},{}}}},{{<!!{!oa'!!}<!!e>}}}}},{{{{{{<i!!!>}!!!>!!{!>},<!!}}!>,<>}}},{<>,<!{!>},<!!}"!a>},{}},{{{<{ie!>!!,!>,<{!!'!>},<!>,<!!!>,!!!>>},{<!>!!>}},{<'<!>u<!!!!<u!!!>o<!!!>!>},<!!"oo>},{}},{{{}},{{{<u>}},{{<!!!>},<!{>}},{{<!>,!!!>!!<'!!u,>},{<o!>},<}e>}}}},{{{},<{!!!!!!!'{<i>},{<>,{{{<{'i!!">}}}}}},{{{<!'<<,!!iuu{!!!!!>!!!>!!!!i!>},<e{}>}},{{{{<aa!!!>,!!!>,<>,{{<>}}},{{{}},{<!!!!!>a!!}>,{<u!<{!!'!!<i"{!!!>},<!!"u",>}},{<!>},<!>,<'">,<{'i!>},<}!<ao!!!>!>},<!u!e,o,}'e!>,<>}}},{{{<ia<'{!>},<,'!!o!!!>,<!!!>!}o!!iei!>},<!!!>>}},{<!!u,!!!!!>!>},<!!!!!"ae'!!!!"!>>}}},{<u!!,!!!>,<!!!!!>!!!!e!!!>!!a>,{}}}}},{{{{{<>,{{<<}}!',}!>!>,<oa<!>,<o}e!!!>ia!!u>,{}},{<e!!,'!!!>a'>}}},{{{},{{<!!<iu{!!!>iu!!!!!>!!ae>}}}},{{<'"i!>,<e!>!!{o!<>,{<,!>!>},<!!i,!>,<{"e}u!>,<{<i>}}}}},{{{<}}!>},<'a!>},<!>},<"i<{e<i!!o!>},<,>,{<<ao'<!>},<a!u<o!!"'o<,{>}},<e'!!'>}},{{{<!{!>},<<!u!>!>},<!>},<ei!>},<o"!>},<!!!>a!!ii">,{<,!>,<,,}!>,<a!>i}a,"o{!!!!>}}},{}}},{{{<<u!>},<!>''!!o{!!!o!>,i!>},<,>}}}},{{{{{{<}!!!>,<a<!>,<!!e!>},<!!!!!!ao>,<!!<!>,<,!}!u,a!!!>},<eo>},{{{<!!!>,<!!!>!!!>},<,!!!>},<i>}},<{!!!>!ao!a""o!>!!!!a}!!o<!>},<'!!!>>}},<i<}o'!>,<ae,!!!>,<,iu!!i<>},{{{<!!{a!!<u,!>},<'!>},<!>!oi'!>},<!>,<}a'!>,<>}}}},{{{{{{<!>!>!>,<"!>,<oau!>u,{!!!>a>}},{<!>},<!!!!}"!!!>a!>,<!!a>}},{}},{<!!!u{!>,<!o!aa<i{"!{!!<<>,<!>,<!!!>a'>},{{<"o!>},<!>},<<{u!>},<{"!>,<a!{>},{},{{<!>},<<!>!>!>,<!>,<<u!>},<o,}>},<",i!!!!!!!!<>}}},{{},{}},{{{<ia!>,<{!},}!uu,'}'{!>,<!>},<!>'!>,<>},<>}}},{{<}!>,<!!uu<{!!!>,<"!>!!!!i!>o'!>,<,>,<!!>},{{<}{!>,<<e'!>},<a<!!!>}<u!!!>,u}>},{}},{<!>,<<"!!!{a!>,<!>,<!!!}!!!!!>},<u!>},<{e,>,{<!o<o{!!!>,<o}!!{>,<!>},<"!!a!>>}}},{{{{<!>!!!!!!!>!,{}a!!"'!!o!>!!!o!!!>!''>,{}},{{}},{{}}},{{{{<!>},<>},{<i<!!!>!>,<!{e>}}},{{<!>},<{u'{a,!!!!!!a<a!>,<au!>,<e>},<'!!!>,<o,!!"eo!!!!!>!>!e!>,<ua!!{u>}}},{{{<<>},<iao',a<"e!>,<">},<!>},<!!,a!>a!!!!!>a!!!>!!!>u>},{{},{{}},{{<oo"!!!>!>},<>},<,,,!!!ie'u!i!>o!}!>},<i!>},<ao{!!!>>}}}},{{{<'{'i}aeoo{!>,<aie>,<a'!!}!>!!!>,!u!!!>>}},{{{{<!>!<}>}},{<!ui!o!>,<o!!'!>,<a>},{<!>,<{!e{'>}},{{{<<!>,<!!u!!!!!>!i>},{<">,{{}}}},<!!!>,<e!>!ua!!"!ue',!}au!>>},{<!"'i'!i!>!!'<a!>},<a!>,<a!>,<{>}}},{{{<a!>,<"'<>},{<,'>}},{{<i'",!>},<!>}>}},{<"}}o{!!{!},!<}u!!>,<!>!>},<i!!!!!>,<'i!!!>},<!!!>e,!!o!>},<'o!!!>i!!>}},{{<!!io!!!>!!}!>,<a>,<!>},<!>,<!!!>,<a!!!>"}<!!!,a!!"!!o!,>},{{},{<!>,<!!!!!>"eo'!!eu!>,<!!"!!'!!!!!"!>,!!!>{}o>}}}},{{{{<iu!!!>,<}!!"!>},<"!>},<!!<>}},{{{<a!!!!o}}}!!!!!>!!!>,"o!>,<>}}},{{<!a!!!!!!!>},<>,{<e!!!>a!>},<!>o<!!!!,oiu"}'>,{<!!!>,i!!"i>}}}}},{{{{<u}!>},<i"{}!>},<e"!!!>,<e,!!!!}u>},<<a!!!}!!i!>},<}"!!a}{u>},{<!!}'ei!!!>!u!>,<!"!!!>!>},<"!!!>>,<,o"!>},<!>},<!!>},{<o<!>},<!>},<<!!,>}},{{{<"!>},<}{,a!!!>>},{{{}},{<u!>},<oi!>{o!>,<i!>},<!>{<!>,<}!>},<i,a>}}},{{<}"o,"!!}!!{!>},<}!>u>},<e{e>},{<ue'}!!a!!}'!>},<{>,{<e!>},<"u!eui{,!>},<{{'o>}}}}}},{{{{},{{{<!>},<!!}>},<!>!>,<u!!o!>,<!>!!!>!!!>!!!>!>}',e{!'!!!>o>}}},{{{{<!!i<'"!>},<}!!u!!!>!!!>!>,<{>},<e!eea"!!!>!!e}>},<>},{{{<{!!!>,<e!!!>!>,!>'i!!!>!!{'!!!><ia!!!>u>}},{<!>!!!>},<,!!!>!!!>}o"!>>}}}},{{{<i}!>,<!,!>,<!>!>!>},<>}},{{<e{!>},<o!!!>!>},<"}!>!>,<!!!>!!!>a<u>,{<,!>{,<e<i<eo"!>,<,}o',!>,<>}},{{}}}},{{{<'<!>"!'!!!!o!"!!{!>,<,!"u{<,!">},{}},{{},<aa!>}!!'!!!>!eaae{!!!>},<!>oo>},{<!aoa!!>,<!>},<,!!!!!>!i,!>},<a>}}},{{{{{<a}!!!>,<!!!><a!!i!e<u"!a}"i!>,<!e>}},<!!e!!!>,!>},<!>!!>},{<!o!>},<<!!!!{!!!!e!!o!i!!!>!}!!!{>,{{<}i!!!>!!"!>},<!>},<eo{u"{!!!>!!i<{>,{<e!!}<}!>},<a!!!>,<!aea!!{<!!!!",!>,<>}},{<{!>>}}},{{<!!}!>,<{}'e!<>},{<<i!>!!!>>}}}},{{{},{{<!>!!a"<u!!e!a!!a{!>},<!!!>!>,<>},{{},{{{},<e{!!"!>},<!">}}},{{{<!>!,!>,<i'!!e'o,!}!ie}>,{{{<!!ei!!{>},{<!>,<'!>},<!>,<"<}<i!>,<i>}},{<!>eu{i'!!oou!>,<<!>,!!!!!>}o}!>,<>}}},{{{<>},{<i!!aao!><!>},<>}},{{<!!!>!!'<!!!!>,<e!!!>'>},{<!>!>},<a!!"i!o!!!a!!!>!!,"">}}},{{{{<i'<{'>},{<!!!>,<!>},<{e,,!>},<!!a{!!!!!!!!!!,>}},{<a<!,!>},<'!>},<!!}'!!"!"eo!!!>,<!>,<!'>,<eei!>},<<ue'!>>}},{}}},{{<!!!>ei{!!!>"}i<>},{<!"!!u!!!>,!!!!"!>,<!!e,,"<iu!>!!}!e!!{>},{{<ae}!!iiaaoou!!i{}!!}!'>,<"!!!>{a>},{{<!!o!!!>u"!!"{!>},<<!>,<!>},<o!!!>o}!>},<!{!!!!'!>>}}}},{{{<},!>,<!!!!!><!!!!!><!!!>!!!>>},{{{<!>,<>}}}},{<e"!!!>>}}}},{{{{{<!>,<!>,<>},<!!!!!>e!>},<a!>},<u!>},<>}},{{},{<!},"!}!!{o{'!!'ie>}},{{<!>!o{e!>},<!!!!e!!}i!a{>},{<">}}},{{},{<!e"a!!!>{!!!!{a}'!>,<!!!>{!>,<!!!>>,<o{a!!!"<!o<!>!!!!o!>}!>!!"o!!{"!o!!!>>},{{{<!!!>'!>,<<!>!!!>e,<{!>!!,>}}}},{{{{<>},{<,!>},<!>'"e>}},{}},{{{<>},<a{,i,!>,<!>,<!!!>,<!<!!!>!>},<!!!!!!!"!!!>},<>},{{<>},{<!!!>u!a"!>eae!!oi<!>i<o!,!!!!!>>}}},{{},{{<e<ua!!''!>,<!>},<,u!!!!,ue>},<{!>,<>}}}},{{{}},{{},{{<}"}!!!!,!!!>!!!!!>!>i<>},{}},{<!>},<a!!',{,oi!>},<",!!!>u!!!>!>>}},{{{<ou"!!!>e!!"!!!>'>,{<!>!>,<!!{,!>},<!e>}},{{<!!i!!e!>!>},<!!!>!>uu",!!e!!!>a}i!!'>},<!!e'!>!>,e!!"i!!!>}i!ui"uo!!>},{<a!!!>}e>,{{},{{{<<i!>},<ea!!!>,<!!",i!!}!>,<'}!>,<<!a!>},<!!!>!>>}}}}}},{{<!i'!!!a!!!>!>!>e>},{<!>,<!>a'<o,u!!!>!>},<o'<!{o,i>}}},{{{}},{{}}}}},{{{<!>,<}"}a{!!!>!!!>!!!!a{!>eiu>},<,!!!>u>}},{},{{{}},{{},<!>},<'i!u'!!!>e!!oe!>},<!!!>}!ii!>!!e!>,<">},{{<!!!>!>,<!!!>!!!>!!!>!!oe!>},<!!>},<!}!!e>}}}},{{{{{{<i!>!>!!!>eai<!>},<!!{,!>,<!!"!!'{!}!>i>}},{{{<!!!>!!!!!>,<"'!!}!!!}!>eu!!!!!>},<!!i!>,<,>}}},{}},{<}a!>},<!!{!>,<eo!!{!!!>!!!!!<>,{<!>},<!u!!!>u{}io,{'iu!>,<!!!>>}},{{}}},{{{{<!>!!'!!!>},<"!!!!<}i{!>,<<!!'"!!u>},{{},{{<u>}}},{}},{},{}},{{{{<o!>,<!>,<{!!,{i!>}}!"o!!>}},{}},{{{}},<"o>}},{{{{{{<">}}},{<!!!!!>,<"!e!<{{!>,<'ou>,{<>}}},{{<i!!!!a!'!>!!u!'o"!!<!!<u!!!>},<!>},<}>},<!>},<{!>,<}!!!>!!'!!!!{!>,<!>,<>}},{{{{{<!>,<<'!>!!a>}},<!>},<"!!!!!>>},<ei,<<!>>},{{<"!>!>},<ee!>,<>},{<,!>},<!!!>!>i!!}a}{}!>",!}eu>,{<e}!>,<a!>},<eo>}}}},{{<}o!!!>!>,>},{}}},{{},{},{}}},{{{{<!!!>!!!!!>uo,!>},<<i!>"!!!>!o!>,<!!i!{>}},{{},<ae!!!>,<!>e,!!!>,<!>},<a>}},{{<<{"!>},<i}u<!>,<!!!><'"!>},<">,{{<o!!!!!><}i!',!>},<!>},<e"!!!>}>,<!{{o!!!!oe>}}},{{{{<!!!>"e!>},<oo!>,<!!}!!!><>},<>}},{<"<"u,!!!>e!!}!i<a}!!!>!>a>,<'"'a!{!>,<'!>},<>},{{<}}ia!!!>!>},<,!>"!>a!>>},{<!!!!a!!"<!!!>},<>}}},{{<u!>!!!>!oo,!!!><!>,<eu>},{{},<}!>'!},i'>}}},{{{{<!>e!!<'i!>,<"!!"e>,<<{!!!>!>!!!'!!}!'eai!uu!>>}},{{{},{<!!e<!>},<e<!!euo'!>'!o!><oe!!!>>,{<!ai!!ia!>}<!>,<}>}},{{<>,{}},{{{},{}},{{<{"<i"<!e'!"!>},<!!a{!!'>}}},{<!>,<!>,<!!!>!!!>e>,{{}}}}},{{<e<,"<}i!!!ii"!!!!>}},{{{{{{{{<!!!!!!i!!!!!>},<!,{!!>}},{<!!,!>},<<a!!!>i,o}a!>,<o>}},{}},{{}}}},{<{"!>,<!>},<>,<!>},<!!!>!>!!'o!>i!iua""!!!>},<u,e>},{<i!!o!!!!!>!!"!>},<!!!>!!!>!>,>}},{}}},{<"'{<,i<<'"!>},<'!>},<!!!>>,{<}!a!!{>}}},{{{<aa!!!>!>},<a!!!>o}!>},<e!>!>,<<iae!>},<>}},<,>},{{{<!>},<}}a",!eo!>},<e!>},<<uii>}}}},{{{{{{}},{{}},{{{{{<!!'",o!!iia,ae!!i!!i>}},<!>,<u>}},{}}},{{<u<'>,{<"!!"!>},<!!!>u!!!>!>!>!>},<ao"e'>}},{{}}}},{{{<!!<!!!>!{!}!>e>},<!>>},{{{<!>,<!<!>},<a,u!!!>i<{>}},{<o'a{i'e<!!!>!!!><!!!!}"!!!>a<<!!!>!!!>>,{<>}},{<!>,<e!}!!!!<}ii}u>,{<>}}},{{{{{}},{<!>}!>,<u!>{!!o!>,<{oe"!>>}},<!!!!!>!!ue!>},<'u!!!>a'>},{<{!!<>,<}a!!!>!>ooa>}}},{{{{{{}},{}}}},{{{<<!>,<!>},<!>,<<e>},{<!!"!!!!a>,{<}!>,<!>},<!!>}}},<{!!!>},<!<!>!!u!>},<!!!!a!!!>!!!><>},{{<>},{{{<,,!!!>!{{>}}}}}},{{<!>!!!>uu{!!{>,<a!><!{<oaa!>},<ie!!!>!!{,!!!>,<">},{<u!!!>u!!!>}!>a!!!><!!,<!!!>!!!>u,>,{<a>}}}}},{{<"!!!>,<'!!!>!ao>},{<!!{>,<"{!>},<<o,}oi!!a!!!>!!!>>},{{{}},{<a>,{}}}}},{{{<!>,<'!>},<,!>,<ei!>!!!!!!!a!!!>>,{{},{<!!!>!!!>o>}}},{{},{}},{{{<ea{}ae!>!>ee<"!!!>,<>}},{<!!,u{u!!e'i!!!>!>,<i!!i""u!>>}}},{{<,a!!!>!!}{e!>}o!>>,{<},"!a!>!>}}!!!>,!!!>"o!>},<'i{>}},{{<o!u!!,!!!>!!'<}!!,<!'!>,<u"e!!!>},<>},{<>}}},{{{{{<!>,<!>,<'!!!'"!}<!!!>>},{<<,{ei>}}},{{{{<!>},<,<"i!!e!!'i!>},<"!!!>!!!>!!!>,<>},<!!<>},{<u!>}!>,<,!>,<i!!!>!!i!!!>{!>,<>}},{{},{<!>,<u!!!><'u!!'!}!e!"!>{a!o!>},<,!>!>,<!>,<>,<o'!!!>!i"!!<<!>},<a!!!>}>}}},{{<{!!!>>}}},{{<{!>},<!!!>'!!!>,<!!i"o!>>}}},{{{<a!!aii!>,<uo!>,<,>},{<!>},<!>,<e<i>},{{{<!<ee!>!>!!!!!>},<>},<!>},<<"<!a>}}},{{{<'!!!>!!!!!!<!}!>!>},<!>au!i!>u!!!>"<!!u>},{<!>,<a!>},<"!!!"}!!u,<{<'au!!{!>,<>}},{{<{!>},<'iioa!>o'''!!!>u!!!>},<>},{{<i!>},<!>,<u!>>},<!"!>,<<{!ue!!!>i!>!>},<!>>},{<ae!>,<">,{<oau>}}},{{<i!>},<!!>,{<i!!!!!><u!>!>},<o>,{<o{!>>}}},{{{}},<!,!e<"!!!!a!!'!!!i!>,<!>},<oa!>,<!!,e!>i>},{{<e!!!>!>},<o!>,<<!>,<ua,e!!!!a{>},<>}}},{{{<{a!>,<!>,<!>},<"{{'>},{<{>,{<!!!>o<"i!>},<!!o!!!!!>!!!>e!!!><!!o"!!i!>,<!!!>>}},{{<>}}},{{{<!!!!!>>}},<!>"iu'!!a!>},<,!!i!>a<!>e!>},<!>>}},{{<{<!>">},{<!!<}!!!!<u}{>,{<!!<!!!>,!>},<!>!!!>!>},<!!!!<e!!<<!!!'!!au>,{{{}},{<!!e{!>},<{!<i>}}}},{{<}u{}oo''{'<!>},<>,{{{<u'!,!!e{!!!!<!!u>},{{<u!!}!!!!!>!}a!!!!!>>},<!'!!,!>!!!!!>uo!o}!!!>,o>}}}},{{{<e'e'{!>},<!o!!<a<>},{<!>!!<aai!>,<!!!>{e!!>}},{<>,{}},{<i!>u{a'!>,<!>!auu"!>,<o!a,>}},{<'ae{!!!>!>{!>,<>}}}}}},{},{{{{<e!!i!!!a",!>,<<o,!>o!>},<!>},<>},{<!"a!>},<uae!!ei!>!>!!!>>}},{<{iu!>},<!>a">,<{'"o!!!>},<!>},<!!!!!>!<!}!>},<{,"a!!!!"!>},<>},{{<ue!>,<"o!>!>,<!>},<>},{<"!!e"!!!>!>,<u>,{<'!>,!!'!!aia}!>},<!!!>},<<!!!!u!!!>!><e<>}}}},{{{<!>,<,>,{{<<u>}}}},{{{<{u<io!>,<'<u!{"e<}{!>,<"!>>}},{{<!!!>>}}},{<,"{u'!>!>,<!">,{{{<!>,<ea!!!>a!!!!!a!"!},!>o!>,<",!!!,u!!!>},<>}},{<!>,<!>},<}"!>,<!!''<,{!!<ii!!i!>o>}}}},{{{{<ouoi<!>},<!ui!!e!>},<!!!!a>},<!>},<a!!e!>,<!!!>'!>o!>!"{ae{a!!a<i!>>},<i{>},{<i,>,<a!<'i<i'!a"a!i{<!>!>},<!>,<"!>a>}},{{<,{}i!}'!{!>>},{}}},{{{{<i>},{<!o!!!!!>,<a!!!>>,<!>,<e'{o!!!>,<>}},{{<>},{<>,{<!!}<"!!!!!!"!!!>!!!>e!!!>!>a!o!,ue,{!ua>}}},{{{<>},{<!>,<,}"!!ao"!>,<<!!!!!!!!!>,<!>>}},{<}!!!>!!uo}!!!!!!!>,<!!!>!o,u!>,<!!!>a!!,!>>,{<e>}},{{<{!!!>,<!>},<","i!!>,{{<{i'!!{""i!!!>,<!uau,!!!}"e!>>},{{<o>}}}},{},{<!>,<a!>,<{i!!!!!>}a,!!u!>},<!!!>"!>},<!{>,{}}}}}}}}
EOT
