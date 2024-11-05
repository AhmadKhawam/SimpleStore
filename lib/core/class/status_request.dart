enum StatusRequest {
  loading,         // عند بدء الطلب
  success,         // عند نجاح الطلب
  failure,         // عند فشل الطلب لأسباب عامة
  serverFailure,   // عند حدوث خطأ في الخادم
  networkFailure,  // عند عدم توفر اتصال بالإنترنت
  none,            // الحالة الافتراضية أو عدم وجود طلب حاليًا
}
