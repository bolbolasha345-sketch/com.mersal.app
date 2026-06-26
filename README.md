# com.mersal.app

هذا المستودع يحتوي على هيكل مشروع Android (Kotlin) بسيط لتبدأ التطوير.

كيفية التشغيل محليًا (م��حدّث)

1. تأكد من تثبيت Android Studio وAndroid SDK.
2. استنساخ المستودع:

   git clone https://github.com/bolbolasha345-sketch/com.mersal.app.git
   cd com.mersal.app

3. استخدام Gradle wrapper (مُضاف):

   ./gradlew assembleDebug    # على Unix / macOS
   gradlew.bat assembleDebug  # على Windows

   أو افتح المشروع في Android Studio: File -> Open -> اختر مجلد المشروع.
4. تشغيل التطبيق على محاكي أو جهاز فعلي عبر Run -> Run 'app'.

ملاحظات
- أضفت Gradle wrapper (scripts + properties). عند تشغيل ./gradlew سيقوم بتحميل توزيع Gradle المحدد تلقائيًا إذا لم يكن موجودًا.
- إذا رغبت أضيف ملف gradle-wrapper.jar الموثّق، أو أضبط CI لبناء تلقائيًا، فأنفّذ ذلك لاحقًا.
