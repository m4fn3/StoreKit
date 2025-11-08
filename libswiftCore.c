#include <stdint.h>
#include <stdlib.h>

void* swift_getOpaqueTypeConformance(const void * const *arguments, void* descriptor, unsigned index);
void* swift_getTypeByMangledNameInContext(const char *typeNameStart, uint64_t typeNameLength, const void *context, const void * const *genericArgs);
void* swift_getTypeByMangledNameInContextInMetadataState(uint64_t metadataState, const char *typeNameStart, uint64_t typeNameLength, const void *context, const void * const *genericArgs);

void* swift_getOpaqueTypeConformance2(const void * const *arguments, void* descriptor, unsigned index) {
  return swift_getOpaqueTypeConformance(arguments, descriptor, index);
}

void* swift_getTypeByMangledNameInContext2(const char *typeNameStart, uint64_t typeNameLength, const void *context, const void * const *genericArgs) {
    return swift_getTypeByMangledNameInContext(typeNameStart, typeNameLength, context, genericArgs);
}

void* swift_getTypeByMangledNameInContextInMetadataState2(uint64_t metadataState, const char *typeNameStart, uint64_t typeNameLength, const void *context, const void * const *genericArgs) {
    return swift_getTypeByMangledNameInContextInMetadataState(metadataState, typeNameStart, typeNameLength, context, genericArgs);
}

// swift_conformsToProtocol
void* swift_conformsToProtocol(const void *type, const void *protocol);
void* swift_conformsToProtocol2(const void *type, const void *protocol) {
    return swift_conformsToProtocol(type, protocol);
}

// swift_getOpaqueTypeMetadata
void* swift_getOpaqueTypeMetadata(void* request, const void * const *arguments, void* descriptor, unsigned index);
void* swift_getOpaqueTypeMetadata2(void* request, const void * const *arguments, void* descriptor, unsigned index) {
    return swift_getOpaqueTypeMetadata(request, arguments, descriptor, index);
}

