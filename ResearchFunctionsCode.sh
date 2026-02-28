# This file is meant to allow easy research into future improvements to ColorEcho.
# Taken From: https://github.com/aj-seven/Android-Sysinfo/blob/master/sysinfo


#color codes
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
RESET=$(tput sgr0)

#text formatting
BOLD=$(tput bold)
UNDERLINE=$(tput smul)
NO_UNDERLINE=$(tput rmul)


# Function to print texts
PRINT() {
    local style=$1
    local color=$2
    local message=$3
    echo -e "${style}${color}${message}${RESET}"
}

#spinner function
spinner() {
    local message=$1
    local pid=$2
    local delay=0.1
    local colors=("31;5")
    local spinstr='⣾⣽⣻⢿⡿⣟⣯⣷'
    local i=0
    tput civis
    while ps -p $pid > /dev/null; do
        local color=${colors[i++ % ${#colors[@]}]}
        printf "\e[${color}m%s\e[0m" "${spinstr:i++%${#spinstr}:1}"
        sleep $delay
        printf "\b"
    done
    tput cnorm
    printf "   \b\b\b"
} 

print_memory_details() {
    PRINT $BOLD"
     $CYAN Total Memory:           $WHITE $TOTAL_MEM MB
     $CYAN Used Memory:            $WHITE $TOTAL_USED_MEM MB
     $CYAN Available Memory:       $WHITE $AVAILABLE_MEM MB
     $CYAN Buffer+Cache Memory:    $WHITE $BUFFCACHE_MEM MB
     $CYAN Free Buff+Cache Memory: $WHITE $FREE_BUFF_MEM MB
     $CYAN Percentage Usage:       $WHITE $PERCENT_USED_MEM"


#CPU Information
cpu() {
    clear
cpu_info() {
    data=$(lscpu)
    name=$(echo "$data" | grep "Vendor ID" | awk '{print $3}')
    model=$(getprop ro.soc.model)
    arch=$(echo "$data" | grep "Architecture" | awk '{print $2}')
    cores=$(grep -c "^processor" /proc/cpuinfo)
    governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
    order=$(echo "$data" | awk '/Byte Order/ {for (i=3; i<=NF; i++) printf "%s ", $i}')
    op_modes=$(echo "$data" | awk '/CPU op-mode\(s\)/ {print $(NF-1), $NF}')
    features=$(awk '/Features/ && !flag {sub(/^[[:space:]]*Features[[:space:]]*:[[:space:]]*/, ""); print; flag=1}' /proc/cpuinfo)

    model_names=$(echo "$data" | awk '/Model name/ {for (i=3; i<=NF; i++) printf "%s ", $i}')

    min_max_values=$(echo "$data" | awk '/CPU (min|max) MHz:/ {print $NF}')

    scaling_percentages=$(echo "$data" | grep -oP 'CPU\(s\) scaling MHz:\s+\K\d+%')

    vulnerabilities=$(echo "$data" | grep -E "Vulnerability|bugs" | awk '/Vulnerability/ {gsub("Vulnerability ", ""); print $0}')

    abi=$(getprop ro.product.cpu.abi)
    s_abi=$(getprop ro.product.cpu.abilist)
    # Number of CPUs
    num_cpus=$(echo "$model_names" | wc -l)

    PRINT "$BOLD
     $CYAN Name:           $WHITE $name
     $CYAN Model:          $WHITE $model
     $CYAN Architecture:   $WHITE $arch
     $CYAN Operation Mode: $WHITE $op_modes
     $CYAN No. of Cores:   $WHITE $cores
     $CYAN Governor:       $WHITE $governor
     $CYAN ABI:            $WHITE $abi
     $CYAN Supported ABIs: $WHITE $s_abi
     $CYAN Byte Order:     $WHITE $order
     $CYAN Model name:     $WHITE $(echo "$model_names" | awk NR==1)
     $CYAN Min MHz:        $WHITE $(echo "$min_max_values" | awk NR==2)    $(echo "$min_max_values" | awk NR==4)
     $CYAN Max MHz:        $WHITE $(echo "$min_max_values" | awk NR==1)   $(echo "$min_max_values" | awk NR==3)
     $CYAN Max Scaling:    $WHITE $(echo "$scaling_percentages" | awk NR==1)            $(echo "$scaling_percentages" | awk NR==2)
     $CYAN Features:       $WHITE $features
     $UNDERLINE$RED Vulnerabilities:$RESET$BOLD
$WHITE$vulnerabilities"

}


#info about android software
androidinfo() {
    clear
    PRINT $BOLD"
$UNDERLINE$MAGENTA Android Software Info:$RESET$BOLD
     $CYAN Brand:           $WHITE $(getprop ro.product.brand)
     $CYAN Manufacturer:    $WHITE $(getprop ro.product.manufacturer)
     $CYAN Device Model:    $WHITE $(getprop ro.product.model)
     $CYAN Device UI:       $WHITE $(getprop ro.product.brand.ui)
     $CYAN Android Version: $WHITE $(getprop ro.build.version.release)
     $CYAN SDK Version:     $WHITE $(getprop ro.build.version.sdk)
     $CYAN Build Number:    $WHITE $(getprop ro.build.display.id)
     $CYAN Build Date:      $WHITE $(date -d @$(getprop ro.build.date.utc))
     $CYAN Baseband:        $WHITE $(getprop gsm.version.baseband)
     $CYAN Build Type:      $WHITE $(getprop ro.build.type)
     $CYAN Build ID:        $WHITE $(getprop ro.product.build.id)
     $CYAN Language:        $WHITE $(getprop persist.sys.locale)
     $CYAN Timezone:        $WHITE $(getprop persist.sys.timezone)"
     PRINT "$BOLD
$YELLOW INFO:$RESET Press 'Enter' or any key to Quit..."
    read -r
}






