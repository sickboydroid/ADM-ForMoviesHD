.method private logThings()V
	.locals 6

	# Log started custom logging
	const-string v1, "CUSTOM_TAG"
	const-string v2, "Started logging"
	invoke-static {v1, v2}, Lcom/amteam/amplayer/utils/DebugLog;->log(Ljava/lang/String;Ljava/lang/String;)V

	# Log title
    	iget-object v2, p0, Lcom/amteam/amplayer/ui/ProPlayer;->vtitle:Ljava/lang/String;
	invoke-static {v1, v2}, Lcom/Vamteam/amplayer/utils/DebugLog;->log(Ljava/lang/String;Ljava/lang/String;)V

	# Log Cookie
	iget-object v2, p0, Lcom/amteam/amplayer/ui/ProPlayer;->mApp:Lcom/amteam/amplayer/AMPlayerApplication;
    	invoke-virtual {v2}, Lcom/amteam/amplayer/AMPlayerApplication;->getCookie()Ljava/lang/String;
    	move-result-object v2
	invoke-static {v1, v2}, Lcom/Vamteam/amplayer/utils/DebugLog;->log(Ljava/lang/String;Ljava/lang/String;)V

	# Log cookie
	iget-object v2, p0, Lcom/amteam/amplayer/ui/ProPlayer;->mApp:Lcom/amteam/amplayer/AMPlayerApplication;
    	invoke-virtual {v2}, Lcom/amteam/amplayer/AMPlayerApplication;->getCookie()Ljava/lang/String;
	move-result-object v2
	invoke-static {v1, v2}, Lcom/Vamteam/amplayer/utils/DebugLog;->log(Ljava/lang/String;Ljava/lang/String;)V

	# Log User-agent
    	iget-object v2, p0, Lcom/amteam/amplayer/ui/ProPlayer;->mApp:Lcom/amteam/amplayer/AMPlayerApplication;
    	invoke-virtual {v2}, Lcom/amteam/amplayer/AMPlayerApplication;->getUserAgent()Ljava/lang/String;
	move-result-object v2
	invoke-static {v1, v2}, Lcom/Vamteam/amplayer/utils/DebugLog;->log(Ljava/lang/String;Ljava/lang/String;)V

	# Log mySLink (data and type)
    	iget-object v2, p0, Lcom/amteam/amplayer/ui/ProPlayer;->mySLink:Lcom/amteam/amplayer/loader/SLink;
    	iget-object v2, v2, Lcom/amteam/amplayer/loader/SLink;->LinkPlaying:Ljava/lang/String;
    	invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
	move-result-object v2
	invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;
	move-result-object v2
	invoke-static {v1, v2}, Lcom/Vamteam/amplayer/utils/DebugLog;->log(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method	
	

.method private linkToADM()V
    .locals 4

    invoke-virtual {p0}, Lcom/amteam/amplayer/ui/ProPlayer;->logThings()V

    .line 419
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.dv.adm"

    .line 420
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 422
    iget-object v2, p0, Lcom/amteam/amplayer/ui/ProPlayer;->vtitle:Ljava/lang/String;

    const-string v3, "title"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 423
    iget-object v2, p0, Lcom/amteam/amplayer/ui/ProPlayer;->mApp:Lcom/amteam/amplayer/AMPlayerApplication;

    invoke-virtual {v2}, Lcom/amteam/amplayer/AMPlayerApplication;->getCookie()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Cookie"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 424
    iget-object v2, p0, Lcom/amteam/amplayer/ui/ProPlayer;->mApp:Lcom/amteam/amplayer/AMPlayerApplication;

    invoke-virtual {v2}, Lcom/amteam/amplayer/AMPlayerApplication;->getCookie()Ljava/lang/String;

    move-result-object v2

    const-string v3, "cookie"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 425
    iget-object v2, p0, Lcom/amteam/amplayer/ui/ProPlayer;->mApp:Lcom/amteam/amplayer/AMPlayerApplication;

    invoke-virtual {v2}, Lcom/amteam/amplayer/AMPlayerApplication;->getUserAgent()Ljava/lang/String;

    move-result-object v2

    const-string v3, "User-agent"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 426
    iget-object v2, p0, Lcom/amteam/amplayer/ui/ProPlayer;->mySLink:Lcom/amteam/amplayer/loader/SLink;

    iget-object v2, v2, Lcom/amteam/amplayer/loader/SLink;->LinkPlaying:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const-string v3, "video/*"

    .line 427
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 430
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/amteam/amplayer/ui/ProPlayer;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 433
    :catch_0
    :try_start_1
    new-instance v0, Landroid/content/Intent;

    const-string v2, "market://details?id=com.dv.adm"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Lcom/amteam/amplayer/ui/ProPlayer;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :goto_0
    return-void
.end method
