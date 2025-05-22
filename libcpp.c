#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>

#define OS_REASON_LIBSYSTEM     18
void abort_with_reason(uint32_t reason_namespace, uint64_t reason_code, const char *reason_string, uint64_t reason_flags)

__attribute__((noreturn, cold));
int __ZNSt3__122__libcpp_verbose_abortEPKcz(const char *format, ...) {
    char message[1024];
    va_list list;
    va_start(list, format);
    snprintf(message, sizeof(message), format, list);
    va_end(list);
    // libsystem, code fault and generate crash report
    abort_with_reason(18, 2, message, 2);
}
