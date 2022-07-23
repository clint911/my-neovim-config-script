#my neovim config
Note: This has only be tested on unix systems(Arch Linux) but should work on any other linux distribution
1) open a terminal and paste the following command
 vim  ~/.config/nvim/init.vim
 You can replace the first word with any other text editor, notepad++, vim, Neovim, Nano

2)paste the command below into your terminal or simply copy the contents of this text file into your init.vim config file

 cp  nvimconfig.txt ~/.config/nvim/init.vim 

3) save the changes and open a new instance of Neovim

4) Type PlugInstall in the command mode
(you can enter this mode by pressing esc + : )

5) Now press enter to begin your installation

6)The following plugins will be installled:
  1) Vim-airline
  2)nerd-tree for navigating directories
  3)Tokyo dark theme
  4)Tokyo night theme
  5)night-owl
  6)goyo& limelight for the visual set up 
  7)One dark theme (in memory of Atom, Rest in Peace our beloved editor)

 
NOTE: The default theme is tokyo night, you can switch the digits from 0 to 1 to toggle between desired modes

You can uncomment the other themes to flip between themes,
You can also change for your current session using the following command while neovim is open
colorscheme night-owl to switch to the night owl theme

Incase PlugInstall does not work, ensure you have PlugInstall installed first, this can be done in a few steps

Any issues setting up you can reach out to me via email  at clingyking007@gmail.com
