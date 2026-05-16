#!/usr/bin/bash

error_no_args()
{
    echo "$0: no arguments for the script" # name script file
    echo "Try '$0 --help' for more information."
}

error_many_args()
{
    echo "$0: many arguments for the script"
    echo "Try '$0 --help' for more information."  
}

error_unrec_args()
{
    echo "$0: an unrecognized argument $1"
    echo "Try '$0 --help' for more information."  
}

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
    error_no_args
else
    if [[ $# -gt 1 ]]; then
        error_many_args
    else
       case $1 in
            --help)
                help_info
                ;;
            --audit)
                echo "audit info"
                ;;
            --fix)
                echo "fix info"
                ;;
            --find)
                echo "find info"
                ;;
            --simulate)
                echo "simulate info"
                ;;
            --expand-check)
                echo "expand-check info"
                ;;
            *)
                error_unrec_args "$1" # add value in function 
                ;;
        esac
    fi
fi