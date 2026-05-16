#!/usr/bin/bash


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
    echo "show_disk_info"
    #df -h
    #df -i
    #lsblk
    #findmnt
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
   echo "Audit function: "
   echo "1 - Show disk info (df -h, df -i, lsblk, findmnt)"
   echo "2 - Show top 10 big dir"
   echo "3 - Search big files"
   echo "4 - Search delete-open files"
   echo -n "Select number of function: " # input value
   read func_var # get value
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
            *)
                error_unrec_numb_function "$func_var"
                ;;
        esac
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