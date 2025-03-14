mkdir build
cd build
mkdir android
cd android
mkdir arm64_v8a
pushd arm64_v8a
cmake -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE=%ANDROID_NDK_HOME%\build\cmake\android.toolchain.cmake -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-21 ../../../
cmake --build .
popd

mkdir armeabi-v7a
pushd armeabi-v7a
cmake -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE=%ANDROID_NDK_HOME%\build\cmake\android.toolchain.cmake -DANDROID_ABI=armeabi-v7a -DANDROID_PLATFORM=android-21 ../../../
cmake --build .
popd


mkdir x86
pushd x86
cmake -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE=%ANDROID_NDK_HOME%\build\cmake\android.toolchain.cmake -DANDROID_ABI=x86 -DANDROID_PLATFORM=android-21 ../../../
cmake --build .
popd

mkdir x86_64
pushd x86_64
cmake -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE=%ANDROID_NDK_HOME%\build\cmake\android.toolchain.cmake -DANDROID_ABI=x86_64 -DANDROID_PLATFORM=android-21 ../../../
cmake --build .
popd