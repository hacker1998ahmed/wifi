#include <jni.h>
#include <string>

extern "C" JNIEXPORT jstring JNICALL
Java_com_wimax_1flutter_wimax_1flutter_Shell_runNativeCommand(JNIEnv* env, jobject /* this */) {
    std::string cmd = "iw dev wlan0 set type monitor";
    FILE* fp = popen(cmd.c_str(), "r");
    char buffer[128];
    std::string result = "";
    while (fgets(buffer, sizeof(buffer), fp)) {
        result += buffer;
    }
    pclose(fp);
    return env->NewStringUTF(result.c_str());
}