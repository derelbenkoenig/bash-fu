#!/usr/bin/env -S jq -R -f

# JWTs are encoded in URL-safe base64, which replaces + and / with - and _ respectively
# perform the inverse of that here since jq's @base64d only understands the default version of base64
split(".")[0:2]
| map(
    gsub("-"; "+")
    | gsub("_"; "/")
    | @base64d
    | fromjson
)
| .[1] |= (
    def addDecodedTs($k): (. as $skip | try (.["_\($k)_decoded"] = (.[$k] | todate)) catch $skip);
    reduce (keys[]) as $tsk (.;addDecodedTs($tsk))
)
