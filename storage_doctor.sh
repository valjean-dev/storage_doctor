
help_info()
{
    echo "STORAGE DOCTOR."
    echo
    echo "options:"
    echo "--help"
    echo "--audit"
    echo "--fix"
    echo "--find"
    echo "--simulate"
    echo "--expand-check"
    echo
}


if [[ $# -eq 0 ]]; then # check count args
    help_info
else
    echo "$# args"
fi