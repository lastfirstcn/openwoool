.class public LApkToolAid/Global;
.super Ljava/lang/Object;

# static fields
.field public static strLogTime:Ljava/lang/String;
.field public static strLogThreadID:Ljava/lang/String;
.field public static strLogContent:Ljava/lang/String;

# direct methods
.method constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static Get_ApplicationContext()Landroid/content/Context;
    .locals 10

    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    :try_start_0

    const/4 v0, 0x0
    new-array v0, v0, [Ljava/lang/Class;
    const/4 v1, 0x0
    new-array v1, v1, [Ljava/lang/Object;
    const/4 v2, 0x0
    check-cast v2, Ljava/lang/Object;

    const-string v3, "android.app.AppGlobals"
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v3

    const-string v4, "getInitialApplication"
    invoke-virtual {v3, v4, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v4
    invoke-virtual {v4, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4

    check-cast v4, Landroid/app/Application;
    invoke-virtual {v4}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;
    move-result-object v4

    :try_end_0
    return-object v4

    :catch_0
    const v4, 0x0
    return-object v4
.end method

.method public static Get_PackageName()Ljava/lang/String;
    .locals 10

    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    :try_start_0

    invoke-static {}, LApkToolAid/Global;->Get_ApplicationContext()Landroid/content/Context;
    move-result-object v0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v0

    :try_end_0
    return-object v0

    :catch_0
    const-string v0, "unknow.PackageName"
    return-object v0
.end method

.method public static ShowToast(Ljava/lang/String;)V
    .locals 10

    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    :try_start_0

    invoke-static {}, LApkToolAid/Global;->Get_ApplicationContext()Landroid/content/Context;
    move-result-object v0
    const v1, 0x1
    invoke-static {v0, p0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v0
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :try_end_0
    :catch_0
    return-void
.end method

.method public static ShowAlertDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    new-instance v0, Landroid/app/AlertDialog$Builder;
    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    move-result-object v0
    const v1, 0x0
    invoke-virtual {v0, p2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    move-result-object v0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    return-void
.end method

.method public static Get_FilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "/ApkToolAid/"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-static {}, LApkToolAid/Global;->Get_PackageName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "/"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method public static Get_FileName(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 10

    new-instance v0, Ljava/util/Date;
    invoke-direct {v0}, Ljava/util/Date;-><init>()V
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J
    move-result-wide v0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v0
    new-instance v1, Ljava/text/SimpleDateFormat;
    const-string v2, "yyyy-MM-dd"
    if-eqz p1, :cond_0
    const-string v2, "yyyy-MM-dd HH:mm:ss"
    :cond_0
    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "."
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, ".txt"
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    return-object v1
.end method

.method public static WriteFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/io/File;
    .locals 4
    .param p0, "filepath"    # Ljava/lang/String;
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "isAppend"    # Z
    .param p4, "isRetEnd"    # Z

    .prologue
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    :try_start_0

    new-instance v1, Ljava/io/File;
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1}, Ljava/io/File;->exists()Z
    move-result v3
    if-nez v3, :cond_0
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z
    :cond_0

    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v2, "/"
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    new-instance v1, Ljava/io/File;
    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    if-eqz p3, :cond_1
    new-instance v2, Ljava/io/RandomAccessFile;
    const-string v3, "rw"
    invoke-direct {v2, v1, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual {v1}, Ljava/io/File;->length()J
    move-result-wide v3
    invoke-virtual {v2, v3, v4}, Ljava/io/RandomAccessFile;->seek(J)V
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B
    move-result-object v3
    invoke-virtual {v2, v3}, Ljava/io/RandomAccessFile;->write([B)V

    if-eqz p4, :cond_2
    const-string v3, "\r\n"
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B
    move-result-object v3
    invoke-virtual {v2, v3}, Ljava/io/RandomAccessFile;->write([B)V
    :cond_2

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V
    return-object v1

    :cond_1
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B
    move-result-object v3
    invoke-virtual {v2, v3}, Ljava/io/FileOutputStream;->write([B)V
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    return-object v1

    :try_end_0
    :catch_0
    const v1, 0x0
    return-object v1
.end method

.method public static Get_LogContents()V
    .locals 10

    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    :try_start_0
    new-instance v0, Ljava/util/Date;
    invoke-direct {v0}, Ljava/util/Date;-><init>()V
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J
    move-result-wide v0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v0
    new-instance v1, Ljava/text/SimpleDateFormat;
    const-string v2, "yyyy-MM-dd HH:mm:ss"
    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    sput-object v0, LApkToolAid/Global;->strLogTime:Ljava/lang/String;
    :try_end_0

    :goto_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J
    move-result-wide v0
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "ThreadID:"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    sput-object v0, LApkToolAid/Global;->strLogThreadID:Ljava/lang/String;
    :try_end_1

    :goto_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;
    move-result-object v0
    const v1, 0x4
    aget-object v0, v0, v1
    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;
    move-result-object v0
    sput-object v0, LApkToolAid/Global;->strLogContent:Ljava/lang/String;
    :try_end_2

    :goto_2
    return-void

    :catch_0
    const-string v0, ""
    sput-object v0, LApkToolAid/Global;->strLogTime:Ljava/lang/String;
    goto :goto_0

    :catch_1
    const-string v0, ""
    sput-object v0, LApkToolAid/Global;->strLogThreadID:Ljava/lang/String;
    goto :goto_1

    :catch_2
    const-string v0, ""
    sput-object v0, LApkToolAid/Global;->strLogContent:Ljava/lang/String;
    goto :goto_2
.end method

.method public static Get_FilePath_Debug()Ljava/lang/String;
    .locals 10
    const-string v0, "Debug"
    invoke-static {v0}, LApkToolAid/Global;->Get_FilePath(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method public static Get_FilePath_Crash()Ljava/lang/String;
    .locals 10
    const-string v0, "Crash"
    invoke-static {v0}, LApkToolAid/Global;->Get_FilePath(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method public static Get_FileName_Debug()Ljava/lang/String;
    .locals 10
    const-string v0, "Debug"
    const v1, 0x0
    invoke-static {v0, v1}, LApkToolAid/Global;->Get_FileName(Ljava/lang/String;Z)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method public static Get_FileName_Crash()Ljava/lang/String;
    .locals 10
    const-string v0, "Crash"
    const v1, 0x1
    invoke-static {v0, v1}, LApkToolAid/Global;->Get_FileName(Ljava/lang/String;Z)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method
