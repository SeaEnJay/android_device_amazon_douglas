#include <string>

#include <ui/GraphicBufferMapper.h>
#include <ui/PixelFormat.h>

#ifdef __cplusplus
extern "C"
{
#endif

extern void _ZN7android11BufferQueue17createBufferQueueEPNS_2spINS_22IGraphicBufferProducerEEEPNS1_INS_22IGraphicBufferConsumerEEEb(
    void *outProducer, void *outConsumer, bool consumerIsSurfaceFlinger) {} /* Fix Me */

/* BufferQueue::createBuffer */
void _ZN7android11BufferQueue17createBufferQueueEPNS_2spINS_22IGraphicBufferProducerEEEPNS1_INS_22IGraphicBufferConsumerEEERKNS1_INS_19IGraphicBufferAllocEEE(void *outProducer, void *outConsumer, void *allocator __unused) 
{
    _ZN7android11BufferQueue17createBufferQueueEPNS_2spINS_22IGraphicBufferProducerEEEPNS1_INS_22IGraphicBufferConsumerEEEb(
      outProducer, outConsumer, false);
}

#ifdef __cplusplus
}
#endif
