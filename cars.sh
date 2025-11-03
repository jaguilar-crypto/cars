#!/bin/bash


while true; do
  
    echo "-----------------------------"
    echo "Car Inventory Menu:"
    echo "1) Add a car"
    echo "2) List cars"
    echo "3) Quit"
    echo "-----------------------------"
    read -r "Enter your choice (1-3): " choice

    case $choice in
        1)
      
            read -r -p "Enter car make: " year
            read -r -p "Enter car model: " make
            read -r -p "Enter car year: " model
  
            echo "${year}:${make}:${model}" >> "$INVENTORY_FILE"
            echo "Car added successfully!"
            ;;
        2)
          
            if [[ ! -s $INVENTORY_FILE ]]; then
                echo "No cars in inventory."
            else
                echo "Cars in inventory (Sorted by year):"
                sort  -t: -k1nv "$INVENTORY_FILE" | nl -w2 -s". "
            fi
            ;;
        3)
          
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter 1, 2, or 3."
            ;;
    esac
done

