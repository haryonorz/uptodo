class RunningApp {
  final String application;
  final String runningTime;
  final String applicationLogo;

  RunningApp({
    required this.application,
    required this.runningTime,
    required this.applicationLogo,
  });
}

List<RunningApp> listRunningApp = [
  RunningApp(
    application: 'Instagram',
    runningTime: '4h',
    applicationLogo: 'assets/icons/logo_instagram.svg',
  ),
  RunningApp(
    application: 'Twitter',
    runningTime: '3h',
    applicationLogo: 'assets/icons/logo_twitter.svg',
  ),
  RunningApp(
    application: 'Facebook',
    runningTime: '1h',
    applicationLogo: 'assets/icons/logo_facebook.svg',
  ),
  RunningApp(
    application: 'Telegram',
    runningTime: '30m',
    applicationLogo: 'assets/icons/logo_telegram.svg',
  ),
  RunningApp(
    application: 'Gmail',
    runningTime: '45m',
    applicationLogo: 'assets/icons/logo_gmail.svg',
  ),
];
