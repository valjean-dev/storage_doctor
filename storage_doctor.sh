#!/usr/bin/bash

border="===================="
#-----------------------------
# Error exception functions

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

error_unrec_numb_function()
{
    echo "$0: an unrecognized numb function $func_var" 
}

#-----------------------------
# Help function

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

#-----------------------------
# Audit functions

show_disk_info()
{
    while true; do
    echo "Functions show disk info: "
    echo "1 - 'df -h'"
    echo "2 - 'df -i'"
    echo "3 - 'lsblk'"
    echo "4 - 'findmnt'"
    echo "5 - Exit"
    echo -n "Select numb command: "
    read command
    clear
    case $command in
        1)
            echo $border
            df -h
            echo $border
            ;;
        2)
            echo $border
            df -i
            echo $border
            ;;
        3)
            echo $border
            lsblk
            echo $border
            ;;
        4)
            echo $border
            findmnt
            echo $border
            ;;
        5)
            break
            ;;
        *)
            error_unrec_numb_function "$func_var"
            ;;
    esac
    done
}

show_top_10_hard_dir()
{
    echo "show_top_10_hard_dir"
}

search_big_files()
{
    echo "search_big_files"
}

search_del_open_files()
{
    echo "search_del_open_files"
}

audit()
{
    while true; do
    echo "Audit function: "
    echo "1 - Show disk info (df -h, df -i, lsblk, findmnt)"
    echo "2 - Show top 10 big dir"
    echo "3 - Search big files"
    echo "4 - Search delete-open files"
    echo "5 - Exit"
    echo -n "Select number of function: " # input value
    read func_var # get value
    clear
    case $func_var in
        1)
            show_disk_info
            ;;
        2)
            show_top_10_hard_dir
            ;;
        3)
            search_big_files
            ;;
        4)
            search_del_open_files
            ;;
        5)
            exit 0
            ;;
        *)
            error_unrec_numb_function "$func_var"
            ;;
    esac
    done
}

#-----------------------------
# Main block

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
                audit
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