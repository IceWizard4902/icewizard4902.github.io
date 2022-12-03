.class public Lcom/snatik/matches/events/EventBus;
.super Ljava/lang/Object;
.source "EventBus.java"


# static fields
.field private static mInstance:Lcom/snatik/matches/events/EventBus;


# instance fields
.field private final events:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/snatik/matches/events/EventObserver;",
            ">;>;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private obj:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/snatik/matches/events/EventBus;->events:Ljava/util/Map;

    .line 22
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/snatik/matches/events/EventBus;->obj:Ljava/lang/Object;

    .line 25
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/snatik/matches/events/EventBus;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public static getInstance()Lcom/snatik/matches/events/EventBus;
    .locals 1

    .line 29
    sget-object v0, Lcom/snatik/matches/events/EventBus;->mInstance:Lcom/snatik/matches/events/EventBus;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Lcom/snatik/matches/events/EventBus;

    invoke-direct {v0}, Lcom/snatik/matches/events/EventBus;-><init>()V

    sput-object v0, Lcom/snatik/matches/events/EventBus;->mInstance:Lcom/snatik/matches/events/EventBus;

    .line 32
    :cond_0
    sget-object v0, Lcom/snatik/matches/events/EventBus;->mInstance:Lcom/snatik/matches/events/EventBus;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized listen(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V
    .locals 1

    monitor-enter p0

    .line 36
    :try_start_0
    iget-object v0, p0, Lcom/snatik/matches/events/EventBus;->events:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_0

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 40
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    iget-object p2, p0, Lcom/snatik/matches/events/EventBus;->events:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public notify(Lcom/snatik/matches/events/Event;)V
    .locals 4

    .line 52
    iget-object v0, p0, Lcom/snatik/matches/events/EventBus;->obj:Ljava/lang/Object;

    monitor-enter v0

    .line 53
    :try_start_0
    iget-object v1, p0, Lcom/snatik/matches/events/EventBus;->events:Ljava/util/Map;

    invoke-interface {p1}, Lcom/snatik/matches/events/Event;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_0

    .line 55
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/snatik/matches/events/EventObserver;

    .line 56
    move-object v3, p1

    check-cast v3, Lcom/snatik/matches/events/AbstractEvent;

    .line 57
    invoke-virtual {v3, v2}, Lcom/snatik/matches/events/AbstractEvent;->fire(Lcom/snatik/matches/events/EventObserver;)V

    goto :goto_0

    .line 60
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public notify(Lcom/snatik/matches/events/Event;J)V
    .locals 2

    .line 64
    iget-object v0, p0, Lcom/snatik/matches/events/EventBus;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/snatik/matches/events/EventBus$1;

    invoke-direct {v1, p0, p1}, Lcom/snatik/matches/events/EventBus$1;-><init>(Lcom/snatik/matches/events/EventBus;Lcom/snatik/matches/events/Event;)V

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public declared-synchronized unlisten(Ljava/lang/String;Lcom/snatik/matches/events/EventObserver;)V
    .locals 1

    monitor-enter p0

    .line 45
    :try_start_0
    iget-object v0, p0, Lcom/snatik/matches/events/EventBus;->events:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_0

    .line 47
    invoke-interface {p1, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
