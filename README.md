## Instructions:

Save the script as orphancheck.sh edit the script to check the directory you want. Its line 1 of the file. Then make it executable:

```bash
chmod +x orphancheck.sh
```
or save it to your /bin and use it as a global command.

```bash
chmod +x /usr/local/sbin/orphancheck.sh
```

How It Works:

List items: The script lists the contents of the directory, numbering each item.
        Options:
        Option 1: Allows the user to select an item by number to delete.
        Option 2: Deletes all items after confirmation.
        Option 3: Cancels the operation.

Example Run:

```bash
Contents of /path/to/directory:
1. file1.txt
2. file2.txt
3. subdir

Choose an option to delete:
1. Delete a single item
2. Delete all items
3. Cancel
Enter your choice (1-3): 1
Enter the number of the item to delete: 2
Deleted: file2.txt
```
