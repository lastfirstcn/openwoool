.class public LApkToolAid/Debug;
.super Ljava/lang/Object;

# direct methods
.method constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static DebugToFile()V
    .locals 10

    invoke-static {}, LApkToolAid/Global;->Get_LogContents()V

    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    sget-object v1, LApkToolAid/Global;->strLogTime:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "|"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-object v1, LApkToolAid/Global;->strLogThreadID:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "|"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-object v1, LApkToolAid/Global;->strLogContent:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0

    invoke-static {}, LApkToolAid/Global;->Get_FilePath_Debug()Ljava/lang/String;
    move-result-object v1
    invoke-static {}, LApkToolAid/Global;->Get_FileName_Debug()Ljava/lang/String;
    move-result-object v2
    const v3, 0x1
    const v4, 0x1
    invoke-static {v1, v0, v2, v3, v4}, LApkToolAid/Global;->WriteFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/io/File;
    return-void
.end method

.method public static DebugToLog()V
    .locals 10

    invoke-static {}, LApkToolAid/Global;->Get_LogContents()V

    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    sget-object v1, LApkToolAid/Global;->strLogThreadID:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "|"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-object v1, LApkToolAid/Global;->strLogContent:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "ApkToolAid.Debug."
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-static {}, LApkToolAid/Global;->Get_PackageName()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

.method public static CrashToFile()V
    .locals 10
    invoke-static {}, LApkToolAid/Crash;->getInstance()LApkToolAid/Crash;
    move-result-object v0
    invoke-static {}, LApkToolAid/Global;->Get_ApplicationContext()Landroid/content/Context;
    move-result-object v1
    invoke-virtual {v0, v1}, LApkToolAid/Crash;->init(Landroid/content/Context;)V
    return-void
.end method
