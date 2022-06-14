for color in $(ls $HOME/.config/alacritty/colorschemes)
	do
		rm -f $HOME/.config/alacritty/colors.yml
		echo $color
		sleep 1
		cp $HOME/.config/alacritty/colorschemes/$color $HOME/.config/alacritty/colors.yml
		sleep 1
	done

