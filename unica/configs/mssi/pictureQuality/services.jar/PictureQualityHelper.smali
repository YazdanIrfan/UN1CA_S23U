.class public Lcom/samsung/android/displayquality/PictureQualityHelper;
.super Ljava/lang/Object;
.source "qb/101459865 fdb62c57024f08dfdee1e5db20861ba1068431c4e36398642960379bf31615d5"


# static fields
.field private static final TAG:Ljava/lang/String; = "SemDisplayQualityMtk"


# instance fields
.field private DEBUG:Z

.field private final PQ_CLASS:Ljava/lang/String;

.field private mPQClass:Ljava/lang/Class;

.field private mPQGetAALMethod:Ljava/lang/reflect/Method;

.field private mPQSetAALMethod:Ljava/lang/reflect/Method;

.field private mPQSetPicutreMode:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>()V
    .locals 7

    const-string/jumbo v0, "com.mediatek.pq.PictureQuality"

    const-string/jumbo v1, "SemDisplayQualityMtk"

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v2, Landroid/os/Build;->TYPE:Ljava/lang/String;

    const-string/jumbo v3, "eng"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v3, :cond_1

    const-string/jumbo v3, "userdebug"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    move v2, v5

    goto :goto_1

    :cond_1
    :goto_0
    move v2, v4

    :goto_1
    iput-boolean v2, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->DEBUG:Z

    iput-object v0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->PQ_CLASS:Ljava/lang/String;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQClass:Ljava/lang/Class;

    iput-object v2, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQGetAALMethod:Ljava/lang/reflect/Method;

    iput-object v2, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQSetAALMethod:Ljava/lang/reflect/Method;

    iput-object v2, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQSetPicutreMode:Ljava/lang/reflect/Method;

    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQClass:Ljava/lang/Class;

    const-string/jumbo v3, "getAALFunction"

    new-array v6, v5, [Ljava/lang/Class;

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQGetAALMethod:Ljava/lang/reflect/Method;

    iget-object v0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQClass:Ljava/lang/Class;

    const-string/jumbo v2, "setAALFunctionProperty"

    new-array v3, v4, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v3, v5

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQSetAALMethod:Ljava/lang/reflect/Method;

    iget-object v0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQClass:Ljava/lang/Class;

    const-string/jumbo v2, "setPictureMode"

    new-array v3, v4, [Ljava/lang/Class;

    aput-object v6, v3, v5

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQSetPicutreMode:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    const-string/jumbo p0, "PQ Method not found"

    invoke-static {v1, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :catch_1
    const-string/jumbo p0, "PQ Class not found"

    invoke-static {v1, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    return-void
.end method


# virtual methods
.method public getPQtAALFunction()I
    .locals 3

    iget-object v0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQGetAALMethod:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    const-string/jumbo v2, "SemDisplayQualityMtk"

    if-nez v0, :cond_0

    const-string/jumbo p0, "mPQGetAALMethod not ready"

    invoke-static {v2, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    :try_start_0
    iget-boolean v0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string/jumbo v0, "getAALFunction at PQHelper"

    invoke-static {v2, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQGetAALMethod:Ljava/lang/reflect/Method;

    iget-object p0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQClass:Ljava/lang/Class;

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :goto_1
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return v1
.end method

.method public setPQAALFunctionProperty(I)V
    .locals 2

    iget-object v0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQSetAALMethod:Ljava/lang/reflect/Method;

    const-string/jumbo v1, "SemDisplayQualityMtk"

    if-nez v0, :cond_0

    const-string/jumbo p0, "mPQSetAALMethod not ready"

    invoke-static {v1, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    :try_start_0
    iget-boolean v0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string/jumbo v0, "setAALFunctionProperty at PQHelper"

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQSetAALMethod:Ljava/lang/reflect/Method;

    iget-object p0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQClass:Ljava/lang/Class;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method

.method public setPQSetPictureMode(I)V
    .locals 3

    const-string/jumbo v0, "SetPicutreMode: "

    iget-object v1, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQSetPicutreMode:Ljava/lang/reflect/Method;

    const-string/jumbo v2, "SemDisplayQualityMtk"

    if-nez v1, :cond_0

    const-string/jumbo p0, "mPQSetPicutreMode not ready"

    invoke-static {v2, p0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    :try_start_0
    iget-boolean v1, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->DEBUG:Z

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQSetPicutreMode:Ljava/lang/reflect/Method;

    iget-object p0, p0, Lcom/samsung/android/displayquality/PictureQualityHelper;->mPQClass:Ljava/lang/Class;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method
