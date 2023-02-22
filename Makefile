.DEFAULT_GOAL := install

TARGET := ~/.local/bin
STATIC := ~/.local/share/scripts
install: mpv-scripts alarm-scripts i3-scripts battery-scripts date-scripts audio-scripts weather-scripts bank-scripts keyboard-scripts visuals-scripts

mpv-scripts:
	@echo "Installing mpv scripts"
	cp mpv/addToMpv ${TARGET}

alarm-scripts:
	@echo "Installing alarm scripts"
	cp alarm/blok-pauze ${TARGET}
	mkdir -p ${STATIC}/alarm && cp alarm/alarm.mp3 ${STATIC}/alarm/

i3-scripts:
	@echo "Installing i3 scripts"
	cp i3/blur_lock ${TARGET}
	cp i3/fancy_lock ${TARGET}
	cp i3/sun_lock ${TARGET}
	cp i3/changebacklight ${TARGET}
	cp i3/suspend_lock ${TARGET}
	cp i3/screensaver-timeout ${TARGET}
	cp i3/touchpad_toggle ${TARGET}

battery-scripts:
	@echo "Installing battery scripts"
	cp battery/battery_low_notification ${TARGET}
	cp battery/hibernate_on_low_battery ${TARGET}

keyboard-scripts:
	@echo "Installing keyboard scripts"
	cp keyboard/keyboard_toggle ${TARGET}
	cp keyboard/lightning/lightbar_toggle ${TARGET}
	cp keyboard/lightning/keyboard_intensity ${TARGET}

date-scripts:
	@echo "Installing date scripts"
	cp date/date_script ${TARGET}

audio-scripts:
	@echo "Installing audio scripts"
	cp audio/changeVolume ${TARGET}
	cp audio/playerctl.py ${TARGET}

weather-scripts:
	@echo "Installing weather script"
	cp weather/weather ${TARGET}

bank-scripts:
	@echo "Installing bank script"
	cp bank/qr-code-bank-script ${TARGET}

visuals-scripts:
	@echo "Installing visuals scripts"
	cp visuals/screen_brightness_mode ${TARGET}
	cp visuals/brightness_mode ${TARGET}
