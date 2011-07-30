
##Autotest suite for spring rts

to set it up, you need to add the test.lua widget:

	ln -s LuaUI/Widgets/test.lua ~/.spring/LuaUI/Widgets/test.lua


to run a test, type:

	while ./run.sh ~/local/spring/master/bin/spring -x 800 -y 600 ~/Projects/autotest/testKAIKvsKAIK.txt ;do echo -n; done
logfiles will be created in tmp/
