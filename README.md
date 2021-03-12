# Lamda

Is a command line for the file management which allows you the creation and deletion with renaming files and
directories.

1. [make](#make)
1. [delete](#delete)
1. [rename](#rename)
1. [copy](#copy)
1. [cut](#cut)

### make

Make files or directories with make command example:

```bash
lamda make file index.js style.css main.dart main.ts ...
lamda make dir src lib api docs bin .github .idea com.talat.main ...
```

you can add how match you want as you see also if you're in `lib` directory, and you want to create a `files`
or `directories`
inside a child directory this child called `dir` just do like so:

```bash
lamda make dir .\dir\data
lamda make file .\dir\index.js

lamda make file C:\Users\talat\Desktop\file.js
```

so you create a directory called `data` inside `dir` witch is inside `lib` as self the same happens with files.
`Note` other important think you are able to create files and directories any were, but you should give the entire path
and that's not easy.

### delete

Delete files or directories with make command example:

```bash
lamda delete index.js style.css dir src ...
```

with delete command you don't specific if you want to delete `files` or `directories` just type a path.

### rename

Rename files or directories with make command example:

```bash
lamda rename file oldName newName oldName newName  ...
lamda rename dir  oldName newName oldName newName  ...
```

as you probably note for each `file` you should type his `oldName` with `newName` you want to change in, you can rename
multiple `files`/`directories` just remember `oldName` then `newName`.

### copy

Copy files with copy command example:

```bash
lamda copy file.js dir/file.js ...

lamda copy C:\Users\talat\Desktop\file.js  C:\Users\talat\Desktop\example\lib\file.js
```

yes actually you can copy a single file no multiple no directory, to copy file just type the `fileName` then the `path`,
but if you want you're able to copy and pest from any were, but you know you need the entire path.

### cut

Cut files with cut command example:

```bash
lamda cut file.js dir/file.js ...

lamda cut C:\Users\talat\Desktop\file.js  C:\Users\talat\Desktop\example\lib\file.js
```

as you see it's a "copy" of `copy command` but the difference is the `cut command` copy hte file then delete it.

#

command |  Multiple | specification
:------:|:---------:|:----------:
make    | yes       | yes
delete  | yes       | no
rename  | yes       | yes
copy    | no        | no just files
cut     | no        | no just files
