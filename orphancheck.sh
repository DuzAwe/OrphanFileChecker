search_dir=/downloads/keeps/orphaned_data/
echo "Contents of $search_dir:"
counter=1
for item in "$search_dir"/*; do
    if [ -e "$item" ]; then
     echo "$counter. $(basename "$item")"
     items+=("$item") # Store full paths in an array
     ((counter++))
    fi
done

if [ ${#items[@]} -eq 0 ]; then
    echo "The directory is empty."
    exit 0
fi
echo -e "\nChoose an option to delete:"
echo  "1. Delete a single item"
echo  "2. Delete all items"
echo  "3. Cancel"

read -rp "Pick Option 1-3: " choice

case $choice in
    1)
        # Delete a single item
        read -rp "Enter the number of the item to delete: " item_number

        # Validate input
        if [[ "$item_number" =~ ^[0-9]+$ ]] && (( item_number > 0 && item_number <= ${#items[@]} )); then
            item_to_delete="${items[item_number-1]}"
            rm -r "$item_to_delete" && echo "Deleted: $(basename "$item_to_delete")"
        else
            echo "Invalid selection."
        fi
        ;;
    2)
        # Delete all items
        read -rp "Are you sure you want to delete all items? (y/n): " confirm
        if [[ "$confirm" =~ ^[Yy]$ ]]; then
            for item in "${items[@]}"; do
                rm -r "$item" && echo "Deleted: $(basename "$item")"
            done
        else
            echo "Operation canceled."
        fi
        ;;
    3)
        # Cancel
        echo "Operation canceled."
        ;;
    *)
        echo "Invalid choice. Exiting."
        ;;
esac
