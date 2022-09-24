.class public LApkToolAid/Crash;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;

# static fields
.field private static INSTANCE:LApkToolAid/Crash;

# instance fields
.field private mContext:Landroid/content/Context;
.field private mDefaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

# direct methods
.method static constructor <clinit>()V
    .locals 1
    const/4 v0, 0x0
    sput-object v0, LApkToolAid/Crash;->INSTANCE:LApkToolAid/Crash;
    return-void
.end method

.method private constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static getInstance()LApkToolAid/Crash;
    .locals 1
    sget-object v0, LApkToolAid/Crash;->INSTANCE:LApkToolAid/Crash;
    if-nez v0, :cond_0
    new-instance v0, LApkToolAid/Crash;
    invoke-direct {v0}, LApkToolAid/Crash;-><init>()V
    sput-object v0, LApkToolAid/Crash;->INSTANCE:LApkToolAid/Crash;
    :cond_0
    return-object v0
.end method

.method private getPackageInfo(Landroid/content/Context;)Landroid/content/pm/PackageInfo;
    .locals 10

    .prologue
    const/4 v0, 0x0

    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    move-result-object v1
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v2
    const/4 v3, 0x0
    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    move-result-object v0
    :try_end_0
    :catch_0

    if-nez v0, :cond_0
    new-instance v0, Landroid/content/pm/PackageInfo;
    invoke-direct {v0}, Landroid/content/pm/PackageInfo;-><init>()V
    :cond_0
    return-object v0
.end method

.method private getCrashReport(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "ex"    # Ljava/lang/Throwable;

    .prologue
    invoke-direct {p0, p1}, LApkToolAid/Crash;->getPackageInfo(Landroid/content/Context;)Landroid/content/pm/PackageInfo;
    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;
    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "Version: "
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    iget-object v3, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "("
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    iget v3, v0, Landroid/content/pm/PackageInfo;->versionCode:I
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, ")\r\n"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "Android: "
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "("
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, ")\r\n"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "Exception: "
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "\r\n"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    new-instance v2, Ljava/io/StringWriter;
    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V
    new-instance v3, Ljava/io/PrintWriter;
    invoke-direct {v3, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V
    invoke-virtual {p2, v3}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;
    move-result-object v0
    :goto_0
    if-eqz v0, :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;
    move-result-object v0
    goto :goto_0
    :cond_0
    invoke-virtual {v3}, Ljava/io/PrintWriter;->close()V
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    move-result-object v1
    return-object v1
.end method

# virtual methods
.method public init(Landroid/content/Context;)V
    .locals 1
    iput-object p1, p0, LApkToolAid/Crash;->mContext:Landroid/content/Context;
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;
    move-result-object v0
    iput-object v0, p0, LApkToolAid/Crash;->mDefaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;
    invoke-static {p0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V
    return-void
.end method

.method public handleException(Ljava/lang/Throwable;)Z
    .locals 10

    .prologue
    if-eqz p1, :cond_0

    iget-object v0, p0, LApkToolAid/Crash;->mContext:Landroid/content/Context;
    if-eqz v0, :cond_0

    invoke-direct {p0, v0, p1}, LApkToolAid/Crash;->getCrashReport(Landroid/content/Context;Ljava/lang/Throwable;)Ljava/lang/String;
    move-result-object v0
    new-instance v1, LApkToolAid/CrashThread;
    invoke-direct {v1, v0}, LApkToolAid/CrashThread;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1}, LApkToolAid/CrashThread;->start()V

    const/4 v0, 0x1
    return v0

    :cond_0
    const/4 v0, 0x0
    return v0
.end method

.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 10
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "ex"    # Ljava/lang/Throwable;

    .prologue
    invoke-virtual {p0, p2}, LApkToolAid/Crash;->handleException(Ljava/lang/Throwable;)Z
    move-result v1
    if-nez v1, :cond_0

    iget-object v1, p0, LApkToolAid/Crash;->mDefaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;
    if-eqz v1, :cond_0

    invoke-interface {v1, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    return-void

    :cond_0
    const-wide/16 v2, 0xbb8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    :catch_0
    return-void
.end method
