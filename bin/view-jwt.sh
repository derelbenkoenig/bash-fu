#!/usr/bin/env jq -R -f

# JWTs are encoded in URL-safe base64, which replaces + and / with - and _ respectively
# perform the inverse of that here since jq's @base64d only understands the default version of base64
split(".")[0:2]
| map(
    sub("-"; "+")
    | sub("_"; "/")
    | @base64d
    | fromjson
)
| .[1] |= (
    def addDecodedTs($k): .["_\($k)_decoded"] = (.[$k] | todate);
    reduce ("iat", "nbf", "exp") as $tsk (.;addDecodedTs($tsk))
)
