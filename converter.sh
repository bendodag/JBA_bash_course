 #!/usr/bin/bash

echo "Welcome to the Simple converter!"

while true;
do
    echo "Select an option"
    echo "0. Type '0' or 'quit' to end program"
    echo "1. Convert units"
    echo "2. Add a definition"
    echo "3. Delete a definition"
    read -a user_input_menu
    option="${user_input_menu[0]}"
    case "$option" in
        0 | 'quit' )
            echo "Goodbye!"
            exit;;
        1 )
            echo "Not implemented!";;
        2 )
            echo "Not implemented!";;
        3 )
            echo "Not implemented!";;
        * )
            echo "Invalid option!";;
    esac
done

conversion_result() {
    echo "Result: $(bc -l <<< $value*$constant)"
    break
}

conversion_loop() {
echo "Enter a value to convert:"
while :
    do
        read -a user_input2
        value="${user_input2[0]}"
        if [[ $value =~ ^-?[0-9]+$ ]]; then
            conversion_result
        
        elif [[ $value =~ ^-?[0-9]+.[0-9]+$ ]]; then
            conversion_result
        
        else
            echo "Enter a float or integer value!"
        fi
    done
}

conversion_main() {
echo "Enter a definition:"
read -a user_input1
arr_length="${#user_input1[@]}"
units="${user_input1[0]}"
constant="${user_input1[1]}"

#echo "$arr_length"
#echo "$units"
#echo "$constant"

rs="[a-z]+_to_[a-z]+"
int="-?[0-9]+"
fl="-?[0-9]+.[0-9]+"

if [[ "$arr_length" -eq 2 ]]; then

    if [[ "$units" =~ $rs ]]; then

        if [[ $constant =~ ^-?[0-9]+$ ]]; then
            #echo "The definition is correct!"
            conversion_loop

        elif [[ $constant =~ ^-?[0-9]+.[0-9]+$ ]]; then
            #echo "The definition is correct!"
            conversion_loop
        
        else
            echo "The definition is incorrect!"
        fi

    else
        echo "The definition is incorrect!"
    fi

else
    echo "The definition is incorrect!"
fi
}
