# odsbn-autosnipp.ahk : 
For use with **Obsidian.md**. 

update 20200806 : now works with [AutoHotkey](https://www.autohotkey.com/) ANSI (obsidian-autosnipp_A) or Unicode (obsidian-autosnipp_U)<br>

a quick way to create reference blocks/transclusions from text selection with `CTRL SHIFT X` / `CTRL V`.<br>
You can also clone a block with `CTRL SHIFT C`

### HOW:
* before first use: edit the .ahk to configure your destination folder and naming convention.
* select a block of text and use CTR+SHIFT+X (or CTRL+SHIFT+C for copy) to cut the selected text into a NEW FILE in the /snippets directory of your vault (create the folder beforehand to avoid problems). The file will be named in the format :<br> `yourvault/snippets/yyyyMM/xx_yyyyMMhhmmss-msec_%sourcewindowtitle%.md` and the link to the file is put in the clipboard, ready to be pasted as an Obsidian transclusion (with the format `![[%yourfile%]]`).<br>
### WHY:
since Obsidian doesn't have block-level transclusions, this is a quick hack to get the same functionnality, but manually. Select your text, hit the shortcut, the selection is now a file that can be referenced elsewhere and modified, thus making `clones` or `instances`.<br>
### KNOWN ISSUES :
if you are using Autohotkey Unicode, run obsidian-autosnipp_U.ahk,
if you are using Autohotkey Ansi, run obsidian-autosnipp_A.ahk,
or else you will get errors.

![obsdn-autosnipp-demo.gif](https://github.com/cannibalox/Obsdn-Autosnipp/blob/master/obsdn-autosnipp-demo.gif)

the ahk script will save the selected text into a new markdown file in a specified obsidian vault. The script will put the link to the new file in the clipboard, ready to be pasted as a transclusion in Obsidian.

![Obsidian-autosnipp.png](https://github.com/cannibalox/Obsdn-Autosnipp/blob/master/Obsidian-autosnipp.png)
![obsdn-autosnipp_firefox.png](https://github.com/cannibalox/Obsdn-Autosnipp/blob/master/obsdn-autosnipp_firefox.png)


