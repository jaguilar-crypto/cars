#!/bin/bash


while true; do

    echo "-----------------------------"
    echo "Car Inventory Menu:"
    echo "1) Add a car"
    echo "2) List cars"
    echo "3) Quit"
    echo "-----------------------------"
    read -p "Enter your choice (1-3): " choice

    case $choice in
        1)
      
            read -r "Enter car make: " make
            read -r "Enter car model: " model
            read -r "Enter car year: " year
  
            echo "${make}:${model}:${year}" >> "$INVENTORY_FILE"
            echo "Car added successfully!"
            ;;
        2)
          
            if [[ ! -s $INVENTORY_FILE ]]; then
                echo "No cars in inventory."
            else
                echo "Cars in inventory:"
                cat "$INVENTORY_FILE" | nl -w2 -s". "
            fi
            ;;
        3)
          
            echo "Exiting program. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter 1, 2, or 3."
            ;;
    esac
done
