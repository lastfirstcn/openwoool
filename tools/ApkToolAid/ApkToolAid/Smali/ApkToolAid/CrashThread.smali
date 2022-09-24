.class public LApkToolAid/CrashThread;
.super Ljava/lang/Thread;

# instance fields
.field private CrashReport:Ljava/lang/String;

# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    iput-object p1, p0, LApkToolAid/CrashThread;->CrashReport:Ljava/lang/String;
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V
    return-void
.end method

# virtual methods
.method public run()V
    .locals 10

    .prologue
    invoke-static {}, Landroid/os/Looper;->prepare()V
    iget-object v0, p0, LApkToolAid/CrashThread;->CrashReport:Ljava/lang/String;

    invoke-static {}, LApkToolAid/Global;->Get_FilePath_Crash()Ljava/lang/String;
    move-result-object v5
    invoke-static {}, LApkToolAid/Global;->Get_FileName_Crash()Ljava/lang/String;
    move-result-object v2
    const v3, 0x0
    const v4, 0x0
    invoke-static {v5, v0, v2, v3, v4}, LApkToolAid/Global;->WriteFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "ApkToolAid.Crash."
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-static {}, LApkToolAid/Global;->Get_PackageName()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "\u7a0b\u5e8f\u51fa\u73b0\u5f02\u5e38\u9519\u8bef\r\nCrash\u65e5\u5fd7\u6587\u4ef6\u4fdd\u5b58\u5728\u4e0b\u5217\u76ee\u5f55\u4e2d\r\n"
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static {v1}, LApkToolAid/Global;->ShowToast(Ljava/lang/String;)V
    :try_end_0
    :catch_0

    invoke-static {}, Landroid/os/Looper;->loop()V
    return-void
.end method
