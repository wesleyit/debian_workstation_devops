## Where is your Android Studio folder?
export ANDROID_STUDIO_HOME="/opt/android-studio"

## And the SDK?
export ANDROID_HOME="/opt/android-sdk-linux"

## Good, this is your config, don't change
export ANDROID_BINDIRS="$ANDROID_STUDIO_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
export PATH="$ANDROID_BINDIRS:$PATH"

