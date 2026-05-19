#!/usr/bin/bash

border="===================="
#-----------------------------
# Error exception functions

error_no_args()
{
    echo $border
    echo "$0: no arguments for the script" # name script file
    echo "Try '$0 --help' for more information."
    echo $border
}

error_many_args()
{
    echo $border
    echo "$0: many arguments for the script"
    echo "Try '$0 --help' for more information."  
    echo $border
}

error_unrec_args()
{
    echo $border
    echo "$0: an unrecognized argument $1"
    echo "Try '$0 --help' for more information."  
    echo $border
}

error_unrec_numb_function()
{
    echo $border
    echo "$0: an unrecognized numb function $func_var" 
    echo $border
}

#-----------------------------
# Help function

help_info()
{
    echo $border
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
    echo $border
}

#-----------------------------
# Audit functions



#-----------------------------
# show_disk_info functions

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


#-----------------------------
# show_top_10_hard_dir function

show_top_10_hard_dir()
{
    clear
    echo -n "Enter search path: "
    read path
    echo $border
    sudo du $path -hxd 1 | sort -hr | head -n 10 # d - deep search, h - human size, x - skip dir on diff fs
    echo $border
}

#-----------------------------
# search_big_files

search_big_files()
{
    clear
    echo -n "Size find files (Mb): "
    read size
    echo $border
    echo "Size = $size Mb"
    sudo find / -xdev -type f -size +$(echo $size)M | sort -hr
    echo $border
}

#-----------------------------
# search_del_open_files

search_del_open_files()
{
    echo $border
    sudo lsof +L1
    echo $border
}

#-----------------------------

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
# Fix functions
#-----------------------------
# fix
fix()
{
    while true; do
    echo "Fix function: "
    echo "1 - Cleaning temporary/old files via find"
    echo "2 - Handling the deleted-open case (show PID/FD and freeing up space)"
    echo "3 - Exit"
    echo -n "Select number of function: " # input value
    read func_var # get value
    clear
    case $func_var in
        1)
            clean_tmp_old_files
            ;;
        2)
            handl_del_open_files
            ;;
        3)
            exit 0
            ;;
        *)
            error_unrec_numb_function "$func_var"
            ;;
    esac
    done
}

#-----------------------------
# cleaning temporary/old files
clean_tmp_old_files()
{
    echo $border
    echo -n "Enter path for cleaning tmp/old files: "
    read path
    sudo find $path -type f -atime +10 -delete
    echo $border
}

#-----------------------------
#handling the deleted-open case
handl_del_open_files()
{
    echo $border
    echo "handling the deleted-open case"
    echo $border
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
                fix
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