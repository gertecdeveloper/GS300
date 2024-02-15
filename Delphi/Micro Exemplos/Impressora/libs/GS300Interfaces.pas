{

  Biblioteca de Comunicação para a Lib GS300_APlibrary.jar

  Desenvolvida por:
  - Claudney Sarti Sessa

  Pontos a Verificar marcados com a palavra "Rever"

}

unit GS300Interfaces;

interface

uses
  Androidapi.JNIBridge, Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os, Androidapi.JNI.Util;

type
  // ===== Forward declarations =====

  JAnimator = interface; // android.animation.Animator

  JAnimator_AnimatorListener = interface;
  // android.animation.Animator$AnimatorListener

  JAnimator_AnimatorPauseListener = interface;
  // android.animation.Animator$AnimatorPauseListener

  JKeyframe = interface; // android.animation.Keyframe

  JLayoutTransition = interface; // android.animation.LayoutTransition

  JLayoutTransition_TransitionListener = interface;
  // android.animation.LayoutTransition$TransitionListener

  JPropertyValuesHolder = interface; // android.animation.PropertyValuesHolder

  JStateListAnimator = interface; // android.animation.StateListAnimator

  JTimeInterpolator = interface; // android.animation.TimeInterpolator

  JTypeConverter = interface; // android.animation.TypeConverter

  JTypeEvaluator = interface; // android.animation.TypeEvaluator

  JValueAnimator = interface; // android.animation.ValueAnimator

  JValueAnimator_AnimatorUpdateListener = interface;
  // android.animation.ValueAnimator$AnimatorUpdateListener

  JPathMotion = interface; // android.transition.PathMotion

  JScene = interface; // android.transition.Scene

  JTransition = interface; // android.transition.Transition

  JTransition_EpicenterCallback = interface;
  // android.transition.Transition$EpicenterCallback

  JTransition_TransitionListener = interface;
  // android.transition.Transition$TransitionListener

  JTransitionManager = interface; // android.transition.TransitionManager

  JTransitionPropagation = interface;
  // android.transition.TransitionPropagation

  JTransitionValues = interface; // android.transition.TransitionValues

  JInterpolator = interface; // android.view.animation.Interpolator

  JToolbar_LayoutParams = interface; // android.widget.Toolbar$LayoutParams

  JSubLcdCommon = interface; // com.android.sublcdlibrary.SubLcdCommon

  JBaseSubLcd = interface; // com.android.sublcdlibrary.BaseSubLcd

  JBaseSubLcd_MyReceiver = interface;
  // com.android.sublcdlibrary.BaseSubLcd$MyReceiver

  JOnSubCallback = interface; // com.android.sublcdlibrary.OnSubCallback

  JRQCode = interface; // com.android.sublcdlibrary.RQCode

  JReceiverDataServices = interface;
  // com.android.sublcdlibrary.ReceiverDataServices
  // JReceiverDataServices_1 = interface;//com.android.sublcdlibrary.ReceiverDataServices$1

  JReceiverDataServices_LocalBinder = interface;
  // com.android.sublcdlibrary.ReceiverDataServices$LocalBinder

  JSubLcdConstant = interface; // com.android.sublcdlibrary.SubLcdConstant

  JSubLcdException = interface; // com.android.sublcdlibrary.SubLcdException

  JSubLcdHelper = interface; // com.android.sublcdlibrary.SubLcdHelper

  JSubLcdHelper_VuleCalBack = interface;
  // com.android.sublcdlibrary.SubLcdHelper$VuleCalBack

  JAP80_BuildConfig = interface; // com.elotouch.AP80.BuildConfig

  JIPrinter = interface; // com.elotouch.AP80.printerlibrary.IPrinter

  JAbstractPrinter = interface;
  // com.elotouch.AP80.printerlibrary.AbstractPrinter

  JInnerLcdCallback = interface;
  // com.elotouch.AP80.printerlibrary.InnerLcdCallback

  JInnerPrinterCallback = interface;
  // com.elotouch.AP80.printerlibrary.InnerPrinterCallback

  JInnerPrinterException = interface;
  // com.elotouch.AP80.printerlibrary.InnerPrinterException

  JInnerPrinterManager = interface;
  // com.elotouch.AP80.printerlibrary.InnerPrinterManager

  JInnerPrinterManager_1 = interface;
  // com.elotouch.AP80.printerlibrary.InnerPrinterManager$1

  JInnerPrinterManager_SingletonContainer = interface;
  // com.elotouch.AP80.printerlibrary.InnerPrinterManager$SingletonContainer

  JIPrinterCallback_Stub = interface;
  // com.prints.printerservice.IPrinterCallback$Stub

  JInnerResultCallback = interface;
  // com.elotouch.AP80.printerlibrary.InnerResultCallback

  JPrinterConfigs = interface;
  // com.elotouch.AP80.printerlibrary.PrinterConfigs

  JPrinterConsts = interface; // com.elotouch.AP80.printerlibrary.PrinterConsts

  JPrinterFactoryUtils = interface;
  // com.elotouch.AP80.printerlibrary.PrinterFactoryUtils

  JFormatAlignHelper = interface;
  // com.elotouch.AP80.printerlibrary.format.FormatAlignHelper

  JPrinterAttributes = interface;
  // com.elotouch.AP80.printerlibrary.format.PrinterAttributes

  JPrinterAttributes_1 = interface;
  // com.elotouch.AP80.printerlibrary.format.PrinterAttributes$1

  JContentHelper = interface;
  // com.elotouch.AP80.printerlibrary.text.ContentHelper

  JPrinterViewManager = interface;
  // com.elotouch.AP80.printerlibrary.text.PrinterViewManager

  Jutils_FileUtils = interface;
  // com.elotouch.AP80.printerlibrary.utils.FileUtils

  JStringUtils = interface;
  // com.elotouch.AP80.printerlibrary.utils.StringUtils

  JAP80PrintHelper = interface; // com.elotouch.AP80.sdkhelper.AP80PrintHelper

  JAP80PrintHelper_1 = interface;
  // com.elotouch.AP80.sdkhelper.AP80PrintHelper$1

  JAP80PrintHelper_2 = interface;
  // com.elotouch.AP80.sdkhelper.AP80PrintHelper$2

  JAP80PrintService = interface; // com.elotouch.AP80.sdkhelper.AP80PrintService

  JBytesUtil = interface; // com.elotouch.AP80.utils.BytesUtil

  JDeviceInfoUtils = interface; // com.elotouch.AP80.utils.DeviceInfoUtils

  JESCUtil = interface; // com.elotouch.AP80.utils.ESCUtil

  JP80EscCommand = interface; // com.elotouch.AP80.utils.P80EscCommand

  JBarcodeFormat = interface; // com.google.zxing.BarcodeFormat

  JBinarizer = interface; // com.google.zxing.Binarizer

  JBinaryBitmap = interface; // com.google.zxing.BinaryBitmap

  JReaderException = interface; // com.google.zxing.ReaderException

  JChecksumException = interface; // com.google.zxing.ChecksumException

  JDecodeHintType = interface; // com.google.zxing.DecodeHintType

  Jzxing_Dimension = interface; // com.google.zxing.Dimension

  JEncodeHintType = interface; // com.google.zxing.EncodeHintType

  Jzxing_FormatException = interface; // com.google.zxing.FormatException

  JLuminanceSource = interface; // com.google.zxing.LuminanceSource

  JInvertedLuminanceSource = interface;
  // com.google.zxing.InvertedLuminanceSource

  Jzxing_Reader = interface; // com.google.zxing.Reader

  JMultiFormatReader = interface; // com.google.zxing.MultiFormatReader

  Jzxing_Writer = interface; // com.google.zxing.Writer

  JMultiFormatWriter = interface; // com.google.zxing.MultiFormatWriter

  JMultiFormatWriter_1 = interface; // com.google.zxing.MultiFormatWriter$1

  JNotFoundException = interface; // com.google.zxing.NotFoundException

  JPlanarYUVLuminanceSource = interface;
  // com.google.zxing.PlanarYUVLuminanceSource

  JRGBLuminanceSource = interface; // com.google.zxing.RGBLuminanceSource

  Jzxing_Result = interface; // com.google.zxing.Result

  JResultMetadataType = interface; // com.google.zxing.ResultMetadataType

  JResultPoint = interface; // com.google.zxing.ResultPoint

  JResultPointCallback = interface; // com.google.zxing.ResultPointCallback

  JWriterException = interface; // com.google.zxing.WriterException

  JDetectorResult = interface; // com.google.zxing.common.DetectorResult

  JAztecDetectorResult = interface;
  // com.google.zxing.aztec.AztecDetectorResult

  JAztecReader = interface; // com.google.zxing.aztec.AztecReader

  JAztecWriter = interface; // com.google.zxing.aztec.AztecWriter

  Jdecoder_Decoder = interface; // com.google.zxing.aztec.decoder.Decoder

  JDecoder_1 = interface; // com.google.zxing.aztec.decoder.Decoder$1

  JDecoder_CorrectedBitsResult = interface;
  // com.google.zxing.aztec.decoder.Decoder$CorrectedBitsResult

  JDecoder_Table = interface; // com.google.zxing.aztec.decoder.Decoder$Table

  JDetector = interface; // com.google.zxing.aztec.detector.Detector

  JDetector_CorrectedParameter = interface;
  // com.google.zxing.aztec.detector.Detector$CorrectedParameter

  JDetector_Point = interface; // com.google.zxing.aztec.detector.Detector$Point

  JAztecCode = interface; // com.google.zxing.aztec.encoder.AztecCode

  JToken = interface; // com.google.zxing.aztec.encoder.Token

  JBinaryShiftToken = interface;
  // com.google.zxing.aztec.encoder.BinaryShiftToken

  Jencoder_Encoder = interface; // com.google.zxing.aztec.encoder.Encoder

  JHighLevelEncoder = interface;
  // com.google.zxing.aztec.encoder.HighLevelEncoder

  JHighLevelEncoder_1 = interface;
  // com.google.zxing.aztec.encoder.HighLevelEncoder$1

  JSimpleToken = interface; // com.google.zxing.aztec.encoder.SimpleToken

  JState = interface; // com.google.zxing.aztec.encoder.State

  JResultParser = interface; // com.google.zxing.client.result.ResultParser

  JAbstractDoCoMoResultParser = interface;
  // com.google.zxing.client.result.AbstractDoCoMoResultParser

  JAddressBookAUResultParser = interface;
  // com.google.zxing.client.result.AddressBookAUResultParser

  JAddressBookDoCoMoResultParser = interface;
  // com.google.zxing.client.result.AddressBookDoCoMoResultParser

  JParsedResult = interface; // com.google.zxing.client.result.ParsedResult

  JAddressBookParsedResult = interface;
  // com.google.zxing.client.result.AddressBookParsedResult

  JBizcardResultParser = interface;
  // com.google.zxing.client.result.BizcardResultParser

  JBookmarkDoCoMoResultParser = interface;
  // com.google.zxing.client.result.BookmarkDoCoMoResultParser

  JCalendarParsedResult = interface;
  // com.google.zxing.client.result.CalendarParsedResult

  JEmailAddressParsedResult = interface;
  // com.google.zxing.client.result.EmailAddressParsedResult

  JEmailAddressResultParser = interface;
  // com.google.zxing.client.result.EmailAddressResultParser

  JEmailDoCoMoResultParser = interface;
  // com.google.zxing.client.result.EmailDoCoMoResultParser

  JExpandedProductParsedResult = interface;
  // com.google.zxing.client.result.ExpandedProductParsedResult

  JExpandedProductResultParser = interface;
  // com.google.zxing.client.result.ExpandedProductResultParser

  JGeoParsedResult = interface;
  // com.google.zxing.client.result.GeoParsedResult

  JGeoResultParser = interface;
  // com.google.zxing.client.result.GeoResultParser

  JISBNParsedResult = interface;
  // com.google.zxing.client.result.ISBNParsedResult

  JISBNResultParser = interface;
  // com.google.zxing.client.result.ISBNResultParser

  JParsedResultType = interface;
  // com.google.zxing.client.result.ParsedResultType

  JProductParsedResult = interface;
  // com.google.zxing.client.result.ProductParsedResult

  JProductResultParser = interface;
  // com.google.zxing.client.result.ProductResultParser

  JSMSMMSResultParser = interface;
  // com.google.zxing.client.result.SMSMMSResultParser

  JSMSParsedResult = interface;
  // com.google.zxing.client.result.SMSParsedResult

  JSMSTOMMSTOResultParser = interface;
  // com.google.zxing.client.result.SMSTOMMSTOResultParser

  JSMTPResultParser = interface;
  // com.google.zxing.client.result.SMTPResultParser

  JTelParsedResult = interface;
  // com.google.zxing.client.result.TelParsedResult

  JTelResultParser = interface;
  // com.google.zxing.client.result.TelResultParser

  JTextParsedResult = interface;
  // com.google.zxing.client.result.TextParsedResult

  JURIParsedResult = interface;
  // com.google.zxing.client.result.URIParsedResult

  JURIResultParser = interface;
  // com.google.zxing.client.result.URIResultParser

  JURLTOResultParser = interface;
  // com.google.zxing.client.result.URLTOResultParser

  JVCardResultParser = interface;
  // com.google.zxing.client.result.VCardResultParser

  JVEventResultParser = interface;
  // com.google.zxing.client.result.VEventResultParser

  JVINParsedResult = interface;
  // com.google.zxing.client.result.VINParsedResult

  JVINResultParser = interface;
  // com.google.zxing.client.result.VINResultParser

  JWifiParsedResult = interface;
  // com.google.zxing.client.result.WifiParsedResult

  JWifiResultParser = interface;
  // com.google.zxing.client.result.WifiResultParser

  JBitArray = interface; // com.google.zxing.common.BitArray

  JBitMatrix = interface; // com.google.zxing.common.BitMatrix

  JBitSource = interface; // com.google.zxing.common.BitSource

  JCharacterSetECI = interface; // com.google.zxing.common.CharacterSetECI

  JDecoderResult = interface; // com.google.zxing.common.DecoderResult

  JGridSampler = interface; // com.google.zxing.common.GridSampler

  JDefaultGridSampler = interface; // com.google.zxing.common.DefaultGridSampler

  JECIEncoderSet = interface; // com.google.zxing.common.ECIEncoderSet

  JECIInput = interface; // com.google.zxing.common.ECIInput

  JECIStringBuilder = interface; // com.google.zxing.common.ECIStringBuilder

  JGlobalHistogramBinarizer = interface;
  // com.google.zxing.common.GlobalHistogramBinarizer

  JHybridBinarizer = interface; // com.google.zxing.common.HybridBinarizer

  JMinimalECIInput = interface; // com.google.zxing.common.MinimalECIInput

  JMinimalECIInput_1 = interface; // com.google.zxing.common.MinimalECIInput$1

  JMinimalECIInput_InputEdge = interface;
  // com.google.zxing.common.MinimalECIInput$InputEdge

  JPerspectiveTransform = interface;
  // com.google.zxing.common.PerspectiveTransform

  Jcommon_StringUtils = interface; // com.google.zxing.common.StringUtils

  Jdetector_MathUtils = interface; // com.google.zxing.common.detector.MathUtils

  JMonochromeRectangleDetector = interface;
  // com.google.zxing.common.detector.MonochromeRectangleDetector

  JWhiteRectangleDetector = interface;
  // com.google.zxing.common.detector.WhiteRectangleDetector

  JGenericGF = interface; // com.google.zxing.common.reedsolomon.GenericGF

  JGenericGFPoly = interface;
  // com.google.zxing.common.reedsolomon.GenericGFPoly

  JReedSolomonDecoder = interface;
  // com.google.zxing.common.reedsolomon.ReedSolomonDecoder

  JReedSolomonEncoder = interface;
  // com.google.zxing.common.reedsolomon.ReedSolomonEncoder

  JReedSolomonException = interface;
  // com.google.zxing.common.reedsolomon.ReedSolomonException

  JDataMatrixReader = interface; // com.google.zxing.datamatrix.DataMatrixReader

  JDataMatrixWriter = interface; // com.google.zxing.datamatrix.DataMatrixWriter

  JBitMatrixParser = interface;
  // com.google.zxing.datamatrix.decoder.BitMatrixParser

  JDataBlock = interface; // com.google.zxing.datamatrix.decoder.DataBlock

  JDecodedBitStreamParser = interface;
  // com.google.zxing.datamatrix.decoder.DecodedBitStreamParser

  JDecodedBitStreamParser_1 = interface;
  // com.google.zxing.datamatrix.decoder.DecodedBitStreamParser$1

  JDecodedBitStreamParser_Mode = interface;
  // com.google.zxing.datamatrix.decoder.DecodedBitStreamParser$Mode

  Jdatamatrix_decoder_Decoder = interface;
  // com.google.zxing.datamatrix.decoder.Decoder

  Jdecoder_Version = interface; // com.google.zxing.datamatrix.decoder.Version

  JVersion_1 = interface; // com.google.zxing.datamatrix.decoder.Version$1

  JVersion_ECB = interface; // com.google.zxing.datamatrix.decoder.Version$ECB

  JVersion_ECBlocks = interface;
  // com.google.zxing.datamatrix.decoder.Version$ECBlocks

  Jdetector_Detector = interface;
  // com.google.zxing.datamatrix.detector.Detector

  Jdatamatrix_encoder_Encoder = interface;
  // com.google.zxing.datamatrix.encoder.Encoder

  JASCIIEncoder = interface; // com.google.zxing.datamatrix.encoder.ASCIIEncoder

  JBase256Encoder = interface;
  // com.google.zxing.datamatrix.encoder.Base256Encoder

  JC40Encoder = interface; // com.google.zxing.datamatrix.encoder.C40Encoder

  JSymbolInfo = interface; // com.google.zxing.datamatrix.encoder.SymbolInfo

  JDataMatrixSymbolInfo144 = interface;
  // com.google.zxing.datamatrix.encoder.DataMatrixSymbolInfo144

  JDefaultPlacement = interface;
  // com.google.zxing.datamatrix.encoder.DefaultPlacement

  JEdifactEncoder = interface;
  // com.google.zxing.datamatrix.encoder.EdifactEncoder

  JEncoderContext = interface;
  // com.google.zxing.datamatrix.encoder.EncoderContext

  JErrorCorrection = interface;
  // com.google.zxing.datamatrix.encoder.ErrorCorrection

  Jencoder_HighLevelEncoder = interface;
  // com.google.zxing.datamatrix.encoder.HighLevelEncoder

  JMinimalEncoder = interface;
  // com.google.zxing.datamatrix.encoder.MinimalEncoder

  JMinimalEncoder_1 = interface;
  // com.google.zxing.datamatrix.encoder.MinimalEncoder$1

  JMinimalEncoder_Edge = interface;
  // com.google.zxing.datamatrix.encoder.MinimalEncoder$Edge

  JMinimalEncoder_Input = interface;
  // com.google.zxing.datamatrix.encoder.MinimalEncoder$Input

  JMinimalEncoder_Mode = interface;
  // com.google.zxing.datamatrix.encoder.MinimalEncoder$Mode

  JMinimalEncoder_Result = interface;
  // com.google.zxing.datamatrix.encoder.MinimalEncoder$Result

  JSymbolShapeHint = interface;
  // com.google.zxing.datamatrix.encoder.SymbolShapeHint

  JTextEncoder = interface; // com.google.zxing.datamatrix.encoder.TextEncoder

  JX12Encoder = interface; // com.google.zxing.datamatrix.encoder.X12Encoder

  JMaxiCodeReader = interface; // com.google.zxing.maxicode.MaxiCodeReader

  Jdecoder_BitMatrixParser = interface;
  // com.google.zxing.maxicode.decoder.BitMatrixParser

  Jdecoder_DecodedBitStreamParser = interface;
  // com.google.zxing.maxicode.decoder.DecodedBitStreamParser

  Jmaxicode_decoder_Decoder = interface;
  // com.google.zxing.maxicode.decoder.Decoder

  JByQuadrantReader = interface; // com.google.zxing.multi.ByQuadrantReader

  JMultipleBarcodeReader = interface;
  // com.google.zxing.multi.MultipleBarcodeReader

  JGenericMultipleBarcodeReader = interface;
  // com.google.zxing.multi.GenericMultipleBarcodeReader

  JQRCodeReader = interface; // com.google.zxing.qrcode.QRCodeReader

  JQRCodeMultiReader = interface;
  // com.google.zxing.multi.qrcode.QRCodeMultiReader

  JQRCodeMultiReader_1 = interface;
  // com.google.zxing.multi.qrcode.QRCodeMultiReader$1

  JQRCodeMultiReader_SAComparator = interface;
  // com.google.zxing.multi.qrcode.QRCodeMultiReader$SAComparator

  Jqrcode_detector_Detector = interface;
  // com.google.zxing.qrcode.detector.Detector

  JMultiDetector = interface;
  // com.google.zxing.multi.qrcode.detector.MultiDetector

  JFinderPatternFinder = interface;
  // com.google.zxing.qrcode.detector.FinderPatternFinder

  JMultiFinderPatternFinder = interface;
  // com.google.zxing.multi.qrcode.detector.MultiFinderPatternFinder

  JMultiFinderPatternFinder_1 = interface;
  // com.google.zxing.multi.qrcode.detector.MultiFinderPatternFinder$1

  JMultiFinderPatternFinder_ModuleSizeComparator = interface;
  // com.google.zxing.multi.qrcode.detector.MultiFinderPatternFinder$ModuleSizeComparator

  JOneDReader = interface; // com.google.zxing.oned.OneDReader

  JCodaBarReader = interface; // com.google.zxing.oned.CodaBarReader

  JOneDimensionalCodeWriter = interface;
  // com.google.zxing.oned.OneDimensionalCodeWriter

  JCodaBarWriter = interface; // com.google.zxing.oned.CodaBarWriter

  JCode128Reader = interface; // com.google.zxing.oned.Code128Reader

  JCode128Writer = interface; // com.google.zxing.oned.Code128Writer

  JCode128Writer_1 = interface; // com.google.zxing.oned.Code128Writer$1

  JCode128Writer_CType = interface; // com.google.zxing.oned.Code128Writer$CType

  JCode128Writer_MinimalEncoder = interface;
  // com.google.zxing.oned.Code128Writer$MinimalEncoder

  JMinimalEncoder_Charset = interface;
  // com.google.zxing.oned.Code128Writer$MinimalEncoder$Charset

  JMinimalEncoder_Latch = interface;
  // com.google.zxing.oned.Code128Writer$MinimalEncoder$Latch

  JCode39Reader = interface; // com.google.zxing.oned.Code39Reader

  JCode39Writer = interface; // com.google.zxing.oned.Code39Writer

  JCode93Reader = interface; // com.google.zxing.oned.Code93Reader

  JCode93Writer = interface; // com.google.zxing.oned.Code93Writer

  JUPCEANReader = interface; // com.google.zxing.oned.UPCEANReader

  JEAN13Reader = interface; // com.google.zxing.oned.EAN13Reader

  JUPCEANWriter = interface; // com.google.zxing.oned.UPCEANWriter

  JEAN13Writer = interface; // com.google.zxing.oned.EAN13Writer

  JEAN8Reader = interface; // com.google.zxing.oned.EAN8Reader

  JEAN8Writer = interface; // com.google.zxing.oned.EAN8Writer

  JEANManufacturerOrgSupport = interface;
  // com.google.zxing.oned.EANManufacturerOrgSupport

  JITFReader = interface; // com.google.zxing.oned.ITFReader

  JITFWriter = interface; // com.google.zxing.oned.ITFWriter

  JMultiFormatOneDReader = interface;
  // com.google.zxing.oned.MultiFormatOneDReader

  JMultiFormatUPCEANReader = interface;
  // com.google.zxing.oned.MultiFormatUPCEANReader

  JUPCAReader = interface; // com.google.zxing.oned.UPCAReader

  JUPCAWriter = interface; // com.google.zxing.oned.UPCAWriter

  JUPCEANExtension2Support = interface;
  // com.google.zxing.oned.UPCEANExtension2Support

  JUPCEANExtension5Support = interface;
  // com.google.zxing.oned.UPCEANExtension5Support

  JUPCEANExtensionSupport = interface;
  // com.google.zxing.oned.UPCEANExtensionSupport

  JUPCEReader = interface; // com.google.zxing.oned.UPCEReader

  JUPCEWriter = interface; // com.google.zxing.oned.UPCEWriter

  JAbstractRSSReader = interface; // com.google.zxing.oned.rss.AbstractRSSReader

  JDataCharacter = interface; // com.google.zxing.oned.rss.DataCharacter

  Jrss_FinderPattern = interface; // com.google.zxing.oned.rss.FinderPattern

  Jrss_Pair = interface; // com.google.zxing.oned.rss.Pair

  JRSS14Reader = interface; // com.google.zxing.oned.rss.RSS14Reader

  JRSSUtils = interface; // com.google.zxing.oned.rss.RSSUtils

  JBitArrayBuilder = interface;
  // com.google.zxing.oned.rss.expanded.BitArrayBuilder

  JExpandedPair = interface; // com.google.zxing.oned.rss.expanded.ExpandedPair

  JExpandedRow = interface; // com.google.zxing.oned.rss.expanded.ExpandedRow

  JRSSExpandedReader = interface;
  // com.google.zxing.oned.rss.expanded.RSSExpandedReader

  JAbstractExpandedDecoder = interface;
  // com.google.zxing.oned.rss.expanded.decoders.AbstractExpandedDecoder

  JAI01decoder = interface;
  // com.google.zxing.oned.rss.expanded.decoders.AI01decoder

  JAI01weightDecoder = interface;
  // com.google.zxing.oned.rss.expanded.decoders.AI01weightDecoder

  JAI013x0xDecoder = interface;
  // com.google.zxing.oned.rss.expanded.decoders.AI013x0xDecoder

  JAI013103decoder = interface;
  // com.google.zxing.oned.rss.expanded.decoders.AI013103decoder

  JAI01320xDecoder = interface;
  // com.google.zxing.oned.rss.expanded.decoders.AI01320xDecoder

  JAI01392xDecoder = interface;
  // com.google.zxing.oned.rss.expanded.decoders.AI01392xDecoder

  JAI01393xDecoder = interface;
  // com.google.zxing.oned.rss.expanded.decoders.AI01393xDecoder

  JAI013x0x1xDecoder = interface;
  // com.google.zxing.oned.rss.expanded.decoders.AI013x0x1xDecoder

  JAI01AndOtherAIs = interface;
  // com.google.zxing.oned.rss.expanded.decoders.AI01AndOtherAIs

  JAnyAIDecoder = interface;
  // com.google.zxing.oned.rss.expanded.decoders.AnyAIDecoder

  JBlockParsedResult = interface;
  // com.google.zxing.oned.rss.expanded.decoders.BlockParsedResult

  JCurrentParsingState = interface;
  // com.google.zxing.oned.rss.expanded.decoders.CurrentParsingState

  JCurrentParsingState_State = interface;
  // com.google.zxing.oned.rss.expanded.decoders.CurrentParsingState$State

  JDecodedObject = interface;
  // com.google.zxing.oned.rss.expanded.decoders.DecodedObject

  JDecodedChar = interface;
  // com.google.zxing.oned.rss.expanded.decoders.DecodedChar

  JDecodedInformation = interface;
  // com.google.zxing.oned.rss.expanded.decoders.DecodedInformation

  JDecodedNumeric = interface;
  // com.google.zxing.oned.rss.expanded.decoders.DecodedNumeric

  JFieldParser = interface;
  // com.google.zxing.oned.rss.expanded.decoders.FieldParser

  JFieldParser_DataLength = interface;
  // com.google.zxing.oned.rss.expanded.decoders.FieldParser$DataLength

  JGeneralAppIdDecoder = interface;
  // com.google.zxing.oned.rss.expanded.decoders.GeneralAppIdDecoder

  JPDF417Common = interface; // com.google.zxing.pdf417.PDF417Common

  JPDF417Reader = interface; // com.google.zxing.pdf417.PDF417Reader

  JPDF417ResultMetadata = interface;
  // com.google.zxing.pdf417.PDF417ResultMetadata

  JPDF417Writer = interface; // com.google.zxing.pdf417.PDF417Writer

  JBarcodeMetadata = interface;
  // com.google.zxing.pdf417.decoder.BarcodeMetadata

  JBarcodeValue = interface; // com.google.zxing.pdf417.decoder.BarcodeValue

  JBoundingBox = interface; // com.google.zxing.pdf417.decoder.BoundingBox

  JCodeword = interface; // com.google.zxing.pdf417.decoder.Codeword

  Jpdf417_decoder_DecodedBitStreamParser = interface;
  // com.google.zxing.pdf417.decoder.DecodedBitStreamParser

  Jdecoder_DecodedBitStreamParser_1 = interface;
  // com.google.zxing.pdf417.decoder.DecodedBitStreamParser$1

  Jdecoder_DecodedBitStreamParser_Mode = interface;
  // com.google.zxing.pdf417.decoder.DecodedBitStreamParser$Mode

  JDetectionResult = interface;
  // com.google.zxing.pdf417.decoder.DetectionResult

  JDetectionResultColumn = interface;
  // com.google.zxing.pdf417.decoder.DetectionResultColumn

  JDetectionResultRowIndicatorColumn = interface;
  // com.google.zxing.pdf417.decoder.DetectionResultRowIndicatorColumn

  JPDF417CodewordDecoder = interface;
  // com.google.zxing.pdf417.decoder.PDF417CodewordDecoder

  JPDF417ScanningDecoder = interface;
  // com.google.zxing.pdf417.decoder.PDF417ScanningDecoder

  Jec_ErrorCorrection = interface;
  // com.google.zxing.pdf417.decoder.ec.ErrorCorrection

  JModulusGF = interface; // com.google.zxing.pdf417.decoder.ec.ModulusGF

  JModulusPoly = interface; // com.google.zxing.pdf417.decoder.ec.ModulusPoly

  Jpdf417_detector_Detector = interface;
  // com.google.zxing.pdf417.detector.Detector

  JPDF417DetectorResult = interface;
  // com.google.zxing.pdf417.detector.PDF417DetectorResult

  JBarcodeMatrix = interface; // com.google.zxing.pdf417.encoder.BarcodeMatrix

  JBarcodeRow = interface; // com.google.zxing.pdf417.encoder.BarcodeRow

  JCompaction = interface; // com.google.zxing.pdf417.encoder.Compaction

  JDimensions = interface; // com.google.zxing.pdf417.encoder.Dimensions

  JPDF417 = interface; // com.google.zxing.pdf417.encoder.PDF417

  JPDF417ErrorCorrection = interface;
  // com.google.zxing.pdf417.encoder.PDF417ErrorCorrection

  JPDF417HighLevelEncoder = interface;
  // com.google.zxing.pdf417.encoder.PDF417HighLevelEncoder

  JPDF417HighLevelEncoder_1 = interface;
  // com.google.zxing.pdf417.encoder.PDF417HighLevelEncoder$1

  JPDF417HighLevelEncoder_NoECIInput = interface;
  // com.google.zxing.pdf417.encoder.PDF417HighLevelEncoder$NoECIInput

  JPDF417HighLevelEncoderTestAdapter = interface;
  // com.google.zxing.pdf417.encoder.PDF417HighLevelEncoderTestAdapter

  JQRCodeWriter = interface; // com.google.zxing.qrcode.QRCodeWriter

  Jqrcode_decoder_BitMatrixParser = interface;
  // com.google.zxing.qrcode.decoder.BitMatrixParser

  Jdecoder_DataBlock = interface; // com.google.zxing.qrcode.decoder.DataBlock

  JDataMask = interface; // com.google.zxing.qrcode.decoder.DataMask

  JDataMask_1 = interface; // com.google.zxing.qrcode.decoder.DataMask$1

  JDataMask_2 = interface; // com.google.zxing.qrcode.decoder.DataMask$2

  JDataMask_3 = interface; // com.google.zxing.qrcode.decoder.DataMask$3

  JDataMask_4 = interface; // com.google.zxing.qrcode.decoder.DataMask$4

  JDataMask_5 = interface; // com.google.zxing.qrcode.decoder.DataMask$5

  JDataMask_6 = interface; // com.google.zxing.qrcode.decoder.DataMask$6

  JDataMask_7 = interface; // com.google.zxing.qrcode.decoder.DataMask$7

  JDataMask_8 = interface; // com.google.zxing.qrcode.decoder.DataMask$8

  Jqrcode_decoder_DecodedBitStreamParser = interface;
  // com.google.zxing.qrcode.decoder.DecodedBitStreamParser

  Jqrcode_decoder_DecodedBitStreamParser_1 = interface;
  // com.google.zxing.qrcode.decoder.DecodedBitStreamParser$1

  Jqrcode_decoder_Decoder = interface;
  // com.google.zxing.qrcode.decoder.Decoder

  JErrorCorrectionLevel = interface;
  // com.google.zxing.qrcode.decoder.ErrorCorrectionLevel

  JFormatInformation = interface;
  // com.google.zxing.qrcode.decoder.FormatInformation

  JMode = interface; // com.google.zxing.qrcode.decoder.Mode

  JQRCodeDecoderMetaData = interface;
  // com.google.zxing.qrcode.decoder.QRCodeDecoderMetaData

  Jqrcode_decoder_Version = interface;
  // com.google.zxing.qrcode.decoder.Version

  Jdecoder_Version_ECB = interface;
  // com.google.zxing.qrcode.decoder.Version$ECB

  Jdecoder_Version_ECBlocks = interface;
  // com.google.zxing.qrcode.decoder.Version$ECBlocks

  JAlignmentPattern = interface;
  // com.google.zxing.qrcode.detector.AlignmentPattern

  JAlignmentPatternFinder = interface;
  // com.google.zxing.qrcode.detector.AlignmentPatternFinder

  JFinderPattern = interface; // com.google.zxing.qrcode.detector.FinderPattern

  JFinderPatternFinder_1 = interface;
  // com.google.zxing.qrcode.detector.FinderPatternFinder$1

  JFinderPatternFinder_EstimatedModuleComparator = interface;
  // com.google.zxing.qrcode.detector.FinderPatternFinder$EstimatedModuleComparator

  JFinderPatternInfo = interface;
  // com.google.zxing.qrcode.detector.FinderPatternInfo

  JBlockPair = interface; // com.google.zxing.qrcode.encoder.BlockPair

  JByteMatrix = interface; // com.google.zxing.qrcode.encoder.ByteMatrix

  Jqrcode_encoder_Encoder = interface;
  // com.google.zxing.qrcode.encoder.Encoder

  JEncoder_1 = interface; // com.google.zxing.qrcode.encoder.Encoder$1

  JMaskUtil = interface; // com.google.zxing.qrcode.encoder.MaskUtil

  JMatrixUtil = interface; // com.google.zxing.qrcode.encoder.MatrixUtil

  Jencoder_MinimalEncoder = interface;
  // com.google.zxing.qrcode.encoder.MinimalEncoder

  Jencoder_MinimalEncoder_1 = interface;
  // com.google.zxing.qrcode.encoder.MinimalEncoder$1

  Jencoder_MinimalEncoder_Edge = interface;
  // com.google.zxing.qrcode.encoder.MinimalEncoder$Edge

  JMinimalEncoder_ResultList = interface;
  // com.google.zxing.qrcode.encoder.MinimalEncoder$ResultList

  JResultList_ResultNode = interface;
  // com.google.zxing.qrcode.encoder.MinimalEncoder$ResultList$ResultNode

  JMinimalEncoder_VersionSize = interface;
  // com.google.zxing.qrcode.encoder.MinimalEncoder$VersionSize

  JQRCode = interface; // com.google.zxing.qrcode.encoder.QRCode

  JIPrinterCallback = interface; // com.prints.printerservice.IPrinterCallback

  JIPrinterCallback_Stub_Proxy = interface;
  // com.prints.printerservice.IPrinterCallback$Stub$Proxy

  JIPrinterService = interface; // com.prints.printerservice.IPrinterService

  JIPrinterService_Stub = interface;
  // com.prints.printerservice.IPrinterService$Stub

  JIPrinterService_Stub_Proxy = interface;
  // com.prints.printerservice.IPrinterService$Stub$Proxy

  JISubLcdCallback = interface; // com.xcheng.sublcdservice.ISubLcdCallback

  JISubLcdCallback_Stub = interface;
  // com.xcheng.sublcdservice.ISubLcdCallback$Stub

  JISubLcdCallback_Stub_Proxy = interface;
  // com.xcheng.sublcdservice.ISubLcdCallback$Stub$Proxy

  JISubLcdService = interface; // com.xcheng.sublcdservice.ISubLcdService

  JISubLcdService_Stub = interface;
  // com.xcheng.sublcdservice.ISubLcdService$Stub

  JISubLcdService_Stub_Proxy = interface;
  // com.xcheng.sublcdservice.ISubLcdService$Stub$Proxy

  JSubLcdUtils2 = interface; // com.xcheng.sublcdservice.SubLcdUtils2

  JSubLcdUtils2_1 = interface; // com.xcheng.sublcdservice.SubLcdUtils2$1

  JSubLcdUtils2_2 = interface; // com.xcheng.sublcdservice.SubLcdUtils2$2

  JSubLcdUtils2_SubLcdReceiveData = interface;
  // com.xcheng.sublcdservice.SubLcdUtils2$SubLcdReceiveData

  JSubLcdUtils2_SubLcdUtilsListener = interface;
  // com.xcheng.sublcdservice.SubLcdUtils2$SubLcdUtilsListener

  // ===== Interface declarations =====

  JAnimatorClass = interface(JObjectClass)
    ['{3F76A5DF-389E-4BD3-9861-04C5B00CEADE}']
    { class }
    function init: JAnimator; cdecl;
    { class }     function clone: JAnimator; cdecl;
    { class }     procedure &end; cdecl;
    { class }     function getDuration: Int64; cdecl;
    { class }     function isPaused: Boolean; cdecl;
    { class }     function isRunning: Boolean; cdecl;
    { class }     procedure removeListener(listener: JAnimator_AnimatorListener); cdecl; // Deprecated
    { class }
    procedure removePauseListener(listener: JAnimator_AnimatorPauseListener); cdecl; // Deprecated
    { class }
    procedure resume; cdecl; // Deprecated
    { class }
    procedure setTarget(target: JObject); cdecl; // Deprecated
    { class }
    procedure setupEndValues; cdecl; // Deprecated
    { class }
    procedure setupStartValues; cdecl; // Deprecated
  end;

  [JavaSignature('android/animation/Animator')]
  JAnimator = interface(JObject)
    ['{FA13E56D-1B6D-4A3D-8327-9E5BA785CF21}']
    procedure addListener(listener: JAnimator_AnimatorListener); cdecl;
    procedure addPauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;
    procedure cancel; cdecl;
    function getInterpolator: JTimeInterpolator; cdecl;
    function getListeners: JArrayList; cdecl;
    function getStartDelay: Int64; cdecl;
    function isStarted: Boolean; cdecl; // Deprecated
    procedure pause; cdecl; // Deprecated
    procedure removeAllListeners; cdecl; // Deprecated
    function setDuration(duration: Int64): JAnimator; cdecl; // Deprecated
    procedure setInterpolator(value: JTimeInterpolator); cdecl; // Deprecated
    procedure setStartDelay(startDelay: Int64); cdecl; // Deprecated
    procedure start; cdecl; // Deprecated
  end;

  TJAnimator = class(TJavaGenericImport<JAnimatorClass, JAnimator>)
  end;

  JAnimator_AnimatorListenerClass = interface(IJavaClass)
    ['{5ED6075A-B997-469C-B8D9-0AA8FB7E4798}']
    { class }
    procedure onAnimationCancel(animation: JAnimator); cdecl;
    // Deprecated
  end;

  [JavaSignature('android/animation/Animator$AnimatorListener')]
  JAnimator_AnimatorListener = interface(IJavaInstance)
    ['{E2DE8DD6-628B-4D84-AA46-8A1E3F00FF13}']
    procedure onAnimationEnd(animation: JAnimator); cdecl;
    procedure onAnimationRepeat(animation: JAnimator); cdecl;
    procedure onAnimationStart(animation: JAnimator); cdecl;
  end;

  TJAnimator_AnimatorListener = class(TJavaGenericImport<JAnimator_AnimatorListenerClass, JAnimator_AnimatorListener>)
  end;

  JAnimator_AnimatorPauseListenerClass = interface(IJavaClass)
    ['{CB0DC3F0-63BC-4284-ADD0-2ED367AE11E5}']
    { class }
    procedure onAnimationResume(animation: JAnimator); cdecl;
  end;

  [JavaSignature('android/animation/Animator$AnimatorPauseListener')]
  JAnimator_AnimatorPauseListener = interface(IJavaInstance)
    ['{43C9C106-65EA-4A7D-A958-FAB9E43FA4A6}']
    procedure onAnimationPause(animation: JAnimator); cdecl;
  end;

  TJAnimator_AnimatorPauseListener = class(TJavaGenericImport<JAnimator_AnimatorPauseListenerClass, JAnimator_AnimatorPauseListener>)
  end;

  JKeyframeClass = interface(JObjectClass)
    ['{D383116E-5CCF-48D8-9EA1-B26FBF24BA39}']
    { class }
    function init: JKeyframe; cdecl;
    { class }     function clone: JKeyframe; cdecl;
    { class }     function getFraction: Single; cdecl;
    { class }     function getInterpolator: JTimeInterpolator; cdecl;
    { class }     function ofFloat(fraction: Single; value: Single): JKeyframe; cdecl; overload;
    { class }     function ofFloat(fraction: Single): JKeyframe; cdecl; overload;
    { class }     function ofInt(fraction: Single; value: Integer): JKeyframe; cdecl; overload;
    { class }     function ofInt(fraction: Single): JKeyframe; cdecl; overload;
    { class }     function ofObject(fraction: Single; value: JObject): JKeyframe; cdecl; overload;
    { class }     function ofObject(fraction: Single): JKeyframe; cdecl; overload;
    { class }     procedure setFraction(fraction: Single); cdecl;
    { class }     procedure setInterpolator(interpolator: JTimeInterpolator); cdecl;
  end;

  [JavaSignature('android/animation/Keyframe')]
  JKeyframe = interface(JObject)
    ['{9D0687A4-669E-440F-8290-154739405019}']
    function getType: Jlang_Class; cdecl;
    function getValue: JObject; cdecl;
    function hasValue: Boolean; cdecl;
    procedure setValue(value: JObject); cdecl;
  end;

  TJKeyframe = class(TJavaGenericImport<JKeyframeClass, JKeyframe>)
  end;

  JLayoutTransitionClass = interface(JObjectClass)
    ['{433C5359-0A96-4796-AD7B-8084EF7EF7C4}']
    { class }
    function _GetAPPEARING: Integer; cdecl;
    { class }     function _GetCHANGE_APPEARING: Integer; cdecl;
    { class }     function _GetCHANGE_DISAPPEARING: Integer; cdecl;
    { class }     function _GetCHANGING: Integer; cdecl;
    { class }     function _GetDISAPPEARING: Integer; cdecl;
    { class }     function init: JLayoutTransition; cdecl;
    { class }     procedure addTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl; // Deprecated
    { class }
    procedure disableTransitionType(transitionType: Integer); cdecl;
    // Deprecated
    { class }     function getDuration(transitionType: Integer): Int64; cdecl;
    // Deprecated
    { class }     function getInterpolator(transitionType: Integer): JTimeInterpolator; cdecl; // Deprecated
    { class }
    function getStagger(transitionType: Integer): Int64; cdecl;
    // Deprecated
    { class }     procedure hideChild(parent: JViewGroup; child: JView; newVisibility: Integer); cdecl; overload;
    { class }     function isChangingLayout: Boolean; cdecl;
    { class }     function isRunning: Boolean; cdecl;
    { class }     procedure setAnimateParentHierarchy(animateParentHierarchy: Boolean); cdecl;
    { class }     procedure setAnimator(transitionType: Integer; animator: JAnimator); cdecl;
    { class }     procedure setDuration(duration: Int64); cdecl; overload;
    { class }     procedure setStartDelay(transitionType: Integer; delay: Int64); cdecl;
    { class }     procedure showChild(parent: JViewGroup; child: JView); cdecl; overload; // Deprecated
    { class }
    procedure showChild(parent: JViewGroup; child: JView; oldVisibility: Integer); cdecl; overload;
    { class }     property APPEARING: Integer read _GetAPPEARING;
    { class }     property CHANGE_APPEARING: Integer read _GetCHANGE_APPEARING;
    { class }     property CHANGE_DISAPPEARING: Integer read _GetCHANGE_DISAPPEARING;
    { class }     property CHANGING: Integer read _GetCHANGING;
    { class }     property DISAPPEARING: Integer read _GetDISAPPEARING;
  end;

  [JavaSignature('android/animation/LayoutTransition')]
  JLayoutTransition = interface(JObject)
    ['{42450BEE-EBF2-4954-B9B7-F8DAE7DF0EC1}']
    procedure addChild(parent: JViewGroup; child: JView); cdecl; // Deprecated
    procedure enableTransitionType(transitionType: Integer); cdecl;
    // Deprecated
    function getAnimator(transitionType: Integer): JAnimator; cdecl;
    // Deprecated
    function getStartDelay(transitionType: Integer): Int64; cdecl;
    function getTransitionListeners: JList; cdecl;
    procedure hideChild(parent: JViewGroup; child: JView); cdecl; overload;
    // Deprecated
    function isTransitionTypeEnabled(transitionType: Integer): Boolean; cdecl;
    procedure removeChild(parent: JViewGroup; child: JView); cdecl;
    procedure removeTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;
    procedure setDuration(transitionType: Integer; duration: Int64); cdecl; overload;
    procedure setInterpolator(transitionType: Integer; interpolator: JTimeInterpolator); cdecl;
    procedure setStagger(transitionType: Integer; duration: Int64); cdecl;
  end;

  TJLayoutTransition = class(TJavaGenericImport<JLayoutTransitionClass, JLayoutTransition>)
  end;

  JLayoutTransition_TransitionListenerClass = interface(IJavaClass)
    ['{9FA6F1EC-8EDB-4A05-AF58-B55A525AE114}']
    { class }
    procedure endTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;
    { class }     procedure startTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;
  end;

  [JavaSignature('android/animation/LayoutTransition$TransitionListener')]
  JLayoutTransition_TransitionListener = interface(IJavaInstance)
    ['{0FBE048F-FCDA-4692-B6F1-DE0F07FAE885}']
  end;

  TJLayoutTransition_TransitionListener = class(TJavaGenericImport<JLayoutTransition_TransitionListenerClass, JLayoutTransition_TransitionListener>)
  end;

  JPropertyValuesHolderClass = interface(JObjectClass)
    ['{36C77AFF-9C3F-42B6-88F3-320FE8CF9B25}']
    { class }
    function clone: JPropertyValuesHolder; cdecl; // Deprecated
    { class }
    function getPropertyName: JString; cdecl; // Deprecated
    { class }
    function ofMultiFloat(propertyName: JString; values: TJavaBiArray<Single>): JPropertyValuesHolder; cdecl; overload;
    { class }     function ofMultiFloat(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;
    { class }     function ofMultiInt(propertyName: JString; values: TJavaBiArray<Integer>): JPropertyValuesHolder; cdecl; overload;
    { class }     function ofMultiInt(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;
    { class }     function ofObject(propertyName: JString; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    { class }     function ofObject(property_: JProperty; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    { class }     procedure setEvaluator(evaluator: JTypeEvaluator); cdecl;
    { class }     procedure setPropertyName(propertyName: JString); cdecl;
    // Deprecated
    { class }     function toString: JString; cdecl; // Deprecated
  end;

  [JavaSignature('android/animation/PropertyValuesHolder')]
  JPropertyValuesHolder = interface(JObject)
    ['{12B4ABFD-CBCA-4636-AF2D-C386EF895DC3}']
    procedure setConverter(converter: JTypeConverter); cdecl;
    procedure setProperty(property_: JProperty); cdecl; // Deprecated
  end;

  TJPropertyValuesHolder = class(TJavaGenericImport<JPropertyValuesHolderClass, JPropertyValuesHolder>)
  end;

  JStateListAnimatorClass = interface(JObjectClass)
    ['{109E4067-E218-47B1-93EB-65B8916A98D8}']
    { class }
    function init: JStateListAnimator; cdecl;
  end;

  [JavaSignature('android/animation/StateListAnimator')]
  JStateListAnimator = interface(JObject)
    ['{CA2A9587-26AA-4DC2-8DFF-A1305A37608F}']
    procedure addState(specs: TJavaArray<Integer>; animator: JAnimator); cdecl;
    function clone: JStateListAnimator; cdecl;
    procedure jumpToCurrentState; cdecl;
  end;

  TJStateListAnimator = class(TJavaGenericImport<JStateListAnimatorClass, JStateListAnimator>)
  end;

  JTimeInterpolatorClass = interface(IJavaClass)
    ['{1E682A1C-9102-461D-A3CA-5596683F1D66}']
  end;

  [JavaSignature('android/animation/TimeInterpolator')]
  JTimeInterpolator = interface(IJavaInstance)
    ['{639F8A83-7D9B-49AF-A19E-96B27E46D2AB}']
    function getInterpolation(input: Single): Single; cdecl; // Deprecated
  end;

  TJTimeInterpolator = class(TJavaGenericImport<JTimeInterpolatorClass, JTimeInterpolator>)
  end;

  JTypeConverterClass = interface(JObjectClass)
    ['{BE2DD177-6D79-4B0C-B4F5-4E4CD9D7436D}']
    { class }
    function init(fromClass: Jlang_Class; toClass: Jlang_Class): JTypeConverter; cdecl;
  end;

  [JavaSignature('android/animation/TypeConverter')]
  JTypeConverter = interface(JObject)
    ['{BFEA4116-0766-4AD9-AA8F-4C15A583EB2E}']
    function convert(value: JObject): JObject; cdecl; // Deprecated
  end;

  TJTypeConverter = class(TJavaGenericImport<JTypeConverterClass, JTypeConverter>)
  end;

  JTypeEvaluatorClass = interface(IJavaClass)
    ['{15B67CAF-6F50-4AA3-A88F-C5AF78D62FD4}']
  end;

  [JavaSignature('android/animation/TypeEvaluator')]
  JTypeEvaluator = interface(IJavaInstance)
    ['{F436383D-6F44-40D8-ACDD-9057777691FC}']
    function evaluate(fraction: Single; startValue: JObject; endValue: JObject): JObject; cdecl; // Deprecated
  end;

  TJTypeEvaluator = class(TJavaGenericImport<JTypeEvaluatorClass, JTypeEvaluator>)
  end;

  JValueAnimatorClass = interface(JAnimatorClass)
    ['{FF3B71ED-5A33-45B0-8500-7672B0B98E2C}']
    { class }
    function _GetINFINITE: Integer; cdecl;
    { class }     function _GetRESTART: Integer; cdecl;
    { class }     function _GetREVERSE: Integer; cdecl;
    { class }     function init: JValueAnimator; cdecl;
    { class }     procedure addUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl; // Deprecated
    { class }
    procedure cancel; cdecl; // Deprecated
    { class }
    function getAnimatedValue: JObject; cdecl; overload; // Deprecated
    { class }
    function getAnimatedValue(propertyName: JString): JObject; cdecl; overload; // Deprecated
    { class }
    function getCurrentPlayTime: Int64; cdecl; // Deprecated
    { class }
    function getFrameDelay: Int64; cdecl; // Deprecated
    { class }
    function getRepeatCount: Integer; cdecl; // Deprecated
    { class }
    function getRepeatMode: Integer; cdecl; // Deprecated
    { class }
    function getStartDelay: Int64; cdecl; // Deprecated
    { class }
    procedure pause; cdecl;
    { class }     procedure removeAllUpdateListeners; cdecl;
    { class }     procedure removeUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;
    { class }     procedure setCurrentPlayTime(playTime: Int64); cdecl;
    { class }     function setDuration(duration: Int64): JValueAnimator; cdecl;
    { class }     procedure setEvaluator(value: JTypeEvaluator); cdecl;
    { class }     procedure setFrameDelay(frameDelay: Int64); cdecl;
    { class }     procedure setInterpolator(value: JTimeInterpolator); cdecl;
    { class }     procedure setRepeatCount(value: Integer); cdecl;
    { class }     procedure start; cdecl; // Deprecated
    { class }
    function toString: JString; cdecl; // Deprecated
    { class }
    property INFINITE: Integer read _GetINFINITE;
    { class }     property RESTART: Integer read _GetRESTART;
    { class }     property REVERSE: Integer read _GetREVERSE;
  end;

  [JavaSignature('android/animation/ValueAnimator')]
  JValueAnimator = interface(JAnimator)
    ['{70F92B14-EFD4-4DC7-91DE-6617417AE194}']
    function clone: JValueAnimator; cdecl; // Deprecated
    procedure &end; cdecl; // Deprecated
    function getAnimatedFraction: Single; cdecl; // Deprecated
    function getDuration: Int64; cdecl; // Deprecated
    function getInterpolator: JTimeInterpolator; cdecl; // Deprecated
    function getValues: TJavaObjectArray<JPropertyValuesHolder>; cdecl;
    function isRunning: Boolean; cdecl;
    function isStarted: Boolean; cdecl;
    procedure resume; cdecl;
    procedure REVERSE; cdecl;
    procedure setCurrentFraction(fraction: Single); cdecl;
    procedure setRepeatMode(value: Integer); cdecl; // Deprecated
    procedure setStartDelay(startDelay: Int64); cdecl; // Deprecated
  end;

  TJValueAnimator = class(TJavaGenericImport<JValueAnimatorClass, JValueAnimator>)
  end;

  JValueAnimator_AnimatorUpdateListenerClass = interface(IJavaClass)
    ['{9CA50CBF-4462-4445-82CD-13CE985E2DE4}']
    { class }
    procedure onAnimationUpdate(animation: JValueAnimator); cdecl;
  end;

  [JavaSignature('android/animation/ValueAnimator$AnimatorUpdateListener')]
  JValueAnimator_AnimatorUpdateListener = interface(IJavaInstance)
    ['{0F883491-52EF-4A40-B7D2-FC23E11E46FE}']
  end;

  TJValueAnimator_AnimatorUpdateListener = class(TJavaGenericImport<JValueAnimator_AnimatorUpdateListenerClass, JValueAnimator_AnimatorUpdateListener>)
  end;

  JPathMotionClass = interface(JObjectClass)
    ['{E1CD1A94-115C-492C-A490-37F0E72956EB}']
    { class }
    function init: JPathMotion; cdecl; overload;
    { class }     function init(context: JContext; attrs: JAttributeSet): JPathMotion; cdecl; overload;
    { class }     function getPath(startX: Single; startY: Single; endX: Single; endY: Single): JPath; cdecl; // Deprecated
  end;

  [JavaSignature('android/transition/PathMotion')]
  JPathMotion = interface(JObject)
    ['{BDC08353-C9FB-42D7-97CC-C35837D2F536}']
  end;

  TJPathMotion = class(TJavaGenericImport<JPathMotionClass, JPathMotion>)
  end;

  JSceneClass = interface(JObjectClass)
    ['{8B9120CA-AEEA-4DE3-BDC9-15CFD23A7B07}']
    { class }
    function init(sceneRoot: JViewGroup): JScene; cdecl; overload;
    { class }     function init(sceneRoot: JViewGroup; layout: JView): JScene; cdecl; overload;
    { class }     function init(sceneRoot: JViewGroup; layout: JViewGroup): JScene; cdecl; overload; // Deprecated
    { class }
    procedure enter; cdecl; // Deprecated
    { class }
    procedure exit; cdecl; // Deprecated
    { class }
    function getSceneForLayout(sceneRoot: JViewGroup; layoutId: Integer; context: JContext): JScene; cdecl; // Deprecated
  end;

  [JavaSignature('android/transition/Scene')]
  JScene = interface(JObject)
    ['{85A60B99-5837-4F1F-A344-C627DD586B82}']
    function getSceneRoot: JViewGroup; cdecl;
    procedure setEnterAction(action: JRunnable); cdecl;
    procedure setExitAction(action: JRunnable); cdecl;
  end;

  TJScene = class(TJavaGenericImport<JSceneClass, JScene>)
  end;

  JTransitionClass = interface(JObjectClass)
    ['{60EC06BC-8F7A-4416-A04B-5B57987EB18E}']
    { class }
    function _GetMATCH_ID: Integer; cdecl;
    { class }     function _GetMATCH_INSTANCE: Integer; cdecl;
    { class }     function _GetMATCH_ITEM_ID: Integer; cdecl;
    { class }     function _GetMATCH_NAME: Integer; cdecl;
    { class }     function init: JTransition; cdecl; overload;
    { class }     function init(context: JContext; attrs: JAttributeSet): JTransition; cdecl; overload;
    { class }     function addListener(listener: JTransition_TransitionListener): JTransition; cdecl;
    { class }     function addTarget(target: JView): JTransition; cdecl; overload;
    { class }     function canRemoveViews: Boolean; cdecl;
    { class }     procedure captureEndValues(transitionValues: JTransitionValues); cdecl;
    { class }     function excludeChildren(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;
    { class }     function excludeChildren(target: JView; exclude: Boolean): JTransition; cdecl; overload;
    { class }     function excludeChildren(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;
    { class }     function excludeTarget(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload; // Deprecated
    { class }
    function getDuration: Int64; cdecl; // Deprecated
    { class }
    function getEpicenter: JRect; cdecl; // Deprecated
    { class }
    function getPathMotion: JPathMotion; cdecl; // Deprecated
    { class }
    function getPropagation: JTransitionPropagation; cdecl;
    // Deprecated
    { class }     function getTargetTypes: JList; cdecl; // Deprecated
    { class }
    function getTargets: JList; cdecl; // Deprecated
    { class }
    function getTransitionProperties: TJavaObjectArray<JString>; cdecl; // Deprecated
    { class }
    function removeTarget(targetId: Integer): JTransition; cdecl; overload; // Deprecated
    { class }
    function removeTarget(targetName: JString): JTransition; cdecl; overload; // Deprecated
    { class }
    function removeTarget(target: JView): JTransition; cdecl; overload; // Deprecated
    { class }
    function setInterpolator(interpolator: JTimeInterpolator): JTransition; cdecl;
    { class }     procedure setPathMotion(pathMotion: JPathMotion); cdecl;
    { class }     property MATCH_ID: Integer read _GetMATCH_ID;
    { class }     property MATCH_INSTANCE: Integer read _GetMATCH_INSTANCE;
    { class }     property MATCH_ITEM_ID: Integer read _GetMATCH_ITEM_ID;
    { class }     property MATCH_NAME: Integer read _GetMATCH_NAME;
  end;

  [JavaSignature('android/transition/Transition')]
  JTransition = interface(JObject)
    ['{C2F8200F-1C83-40AE-8C5B-C0C8BFF17F88}']
    function addTarget(targetId: Integer): JTransition; cdecl; overload;
    function addTarget(targetName: JString): JTransition; cdecl; overload;
    function addTarget(targetType: Jlang_Class): JTransition; cdecl; overload;
    procedure captureStartValues(transitionValues: JTransitionValues); cdecl;
    function clone: JTransition; cdecl;
    function createAnimator(sceneRoot: JViewGroup; startValues: JTransitionValues; endValues: JTransitionValues): JAnimator; cdecl;
    function excludeTarget(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload; // Deprecated
    function excludeTarget(targetName: JString; exclude: Boolean): JTransition; cdecl; overload; // Deprecated
    function excludeTarget(target: JView; exclude: Boolean): JTransition; cdecl; overload; // Deprecated
    function getEpicenterCallback: JTransition_EpicenterCallback; cdecl;
    // Deprecated
    function getInterpolator: JTimeInterpolator; cdecl; // Deprecated
    function getName: JString; cdecl; // Deprecated
    function getStartDelay: Int64; cdecl; // Deprecated
    function getTargetIds: JList; cdecl; // Deprecated
    function getTargetNames: JList; cdecl; // Deprecated
    function getTransitionValues(view: JView; start: Boolean): JTransitionValues; cdecl; // Deprecated
    function isTransitionRequired(startValues: JTransitionValues; endValues: JTransitionValues): Boolean; cdecl; // Deprecated
    function removeListener(listener: JTransition_TransitionListener): JTransition; cdecl; // Deprecated
    function removeTarget(target: Jlang_Class): JTransition; cdecl; overload;
    function setDuration(duration: Int64): JTransition; cdecl;
    procedure setEpicenterCallback(epicenterCallback: JTransition_EpicenterCallback); cdecl;
    procedure setPropagation(transitionPropagation: JTransitionPropagation); cdecl;
    function setStartDelay(startDelay: Int64): JTransition; cdecl;
    function toString: JString; cdecl;
  end;

  TJTransition = class(TJavaGenericImport<JTransitionClass, JTransition>)
  end;

  JTransition_EpicenterCallbackClass = interface(JObjectClass)
    ['{8141257A-130B-466C-A08D-AA3A00946F4C}']
    { class }
    function init: JTransition_EpicenterCallback; cdecl;
  end;

  [JavaSignature('android/transition/Transition$EpicenterCallback')]
  JTransition_EpicenterCallback = interface(JObject)
    ['{CE004917-266F-4076-8913-F23184824FBA}']
    function onGetEpicenter(transition: JTransition): JRect; cdecl;
  end;

  TJTransition_EpicenterCallback = class(TJavaGenericImport<JTransition_EpicenterCallbackClass, JTransition_EpicenterCallback>)
  end;

  JTransition_TransitionListenerClass = interface(IJavaClass)
    ['{D5083752-E8A6-46DF-BE40-AE11073C387E}']
    { class }
    procedure onTransitionCancel(transition: JTransition); cdecl;
    { class }     procedure onTransitionEnd(transition: JTransition); cdecl;
    { class }     procedure onTransitionPause(transition: JTransition); cdecl;
  end;

  [JavaSignature('android/transition/Transition$TransitionListener')]
  JTransition_TransitionListener = interface(IJavaInstance)
    ['{C32BE107-6E05-4898-AF0A-FAD970D66E29}']
    procedure onTransitionResume(transition: JTransition); cdecl; // Deprecated
    procedure onTransitionStart(transition: JTransition); cdecl; // Deprecated
  end;

  TJTransition_TransitionListener = class(TJavaGenericImport<JTransition_TransitionListenerClass, JTransition_TransitionListener>)
  end;

  JTransitionManagerClass = interface(JObjectClass)
    ['{4160EFA0-3499-4964-817E-46497BB5B957}']
    { class }
    function init: JTransitionManager; cdecl;
    { class }     procedure beginDelayedTransition(sceneRoot: JViewGroup); cdecl; overload; // Deprecated
    { class }
    procedure beginDelayedTransition(sceneRoot: JViewGroup; transition: JTransition); cdecl; overload; // Deprecated
    { class }
    procedure endTransitions(sceneRoot: JViewGroup); cdecl;
    // Deprecated
    { class }     procedure go(scene: JScene); cdecl; overload; // Deprecated
    { class }
    procedure go(scene: JScene; transition: JTransition); cdecl; overload; // Deprecated
    { class }
    procedure setTransition(scene: JScene; transition: JTransition); cdecl; overload; // Deprecated
    { class }
    procedure setTransition(fromScene: JScene; toScene: JScene; transition: JTransition); cdecl; overload; // Deprecated
    { class }
    procedure transitionTo(scene: JScene); cdecl; // Deprecated
  end;

  [JavaSignature('android/transition/TransitionManager')]
  JTransitionManager = interface(JObject)
    ['{FF5E1210-1F04-4F81-9CAC-3D7A5C4E972B}']
  end;

  TJTransitionManager = class(TJavaGenericImport<JTransitionManagerClass, JTransitionManager>)
  end;

  JTransitionPropagationClass = interface(JObjectClass)
    ['{A881388A-C877-4DD9-9BAD-1BA4F56133EE}']
    { class }
    function init: JTransitionPropagation; cdecl;
    { class }     function getPropagationProperties: TJavaObjectArray<JString>; cdecl;
    { class }     function getStartDelay(sceneRoot: JViewGroup; transition: JTransition; startValues: JTransitionValues; endValues: JTransitionValues): Int64; cdecl;
  end;

  [JavaSignature('android/transition/TransitionPropagation')]
  JTransitionPropagation = interface(JObject)
    ['{7595B7EF-6BCE-4281-BC67-335E2FB6C091}']
    procedure captureValues(transitionValues: JTransitionValues); cdecl;
  end;

  TJTransitionPropagation = class(TJavaGenericImport<JTransitionPropagationClass, JTransitionPropagation>)
  end;

  JTransitionValuesClass = interface(JObjectClass)
    ['{3BF98CFA-6A4D-4815-8D42-15E97C916D91}']
    { class }
    function _Getvalues: JMap; cdecl;
    { class }     function _Getview: JView; cdecl;
    { class }     function init: JTransitionValues; cdecl;
    { class }     function toString: JString; cdecl;
    { class }     property values: JMap read _Getvalues;
    { class }     property view: JView read _Getview;
  end;

  [JavaSignature('android/transition/TransitionValues')]
  JTransitionValues = interface(JObject)
    ['{178E09E6-D32C-48A9-ADCF-8CCEA804052A}']
    function equals(other: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
  end;

  TJTransitionValues = class(TJavaGenericImport<JTransitionValuesClass, JTransitionValues>)
  end;

  JInterpolatorClass = interface(JTimeInterpolatorClass)
    ['{A575B46A-E489-409C-807A-1B8F2BE092E8}']
  end;

  [JavaSignature('android/view/animation/Interpolator')]
  JInterpolator = interface(JTimeInterpolator)
    ['{F1082403-52DA-4AF0-B017-DAB334325FC7}']
  end;

  TJInterpolator = class(TJavaGenericImport<JInterpolatorClass, JInterpolator>)
  end;

  JToolbar_LayoutParamsClass = interface(JActionBar_LayoutParamsClass)
    ['{6D43796C-C163-4084-BB30-6FE68AFD7ABB}']
    { class }
    function init(c: JContext; attrs: JAttributeSet): JToolbar_LayoutParams; cdecl; overload;
    { class }     function init(width: Integer; height: Integer): JToolbar_LayoutParams; cdecl; overload;
    { class }     function init(width: Integer; height: Integer; gravity: Integer): JToolbar_LayoutParams; cdecl; overload;
    { class }     function init(gravity: Integer): JToolbar_LayoutParams; cdecl; overload;
    { class }     function init(source: JToolbar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;
    { class }     function init(source: JActionBar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;
    { class }     function init(source: JViewGroup_MarginLayoutParams): JToolbar_LayoutParams; cdecl; overload;
    { class }     function init(source: JViewGroup_LayoutParams): JToolbar_LayoutParams; cdecl; overload;
  end;

  [JavaSignature('android/widget/Toolbar$LayoutParams')]
  JToolbar_LayoutParams = interface(JActionBar_LayoutParams)
    ['{BCD101F9-B7B7-4B2F-9460-056B3EA7B9F0}']
  end;

  TJToolbar_LayoutParams = class(TJavaGenericImport<JToolbar_LayoutParamsClass, JToolbar_LayoutParams>)
  end;

  JSubLcdCommonClass = interface(IJavaClass)
    ['{F5BA2006-9BCA-4A4A-B6D5-66F3F59ADF9A}']
  end;

  [JavaSignature('com/android/sublcdlibrary/SubLcdCommon')]
  JSubLcdCommon = interface(IJavaInstance)
    ['{40C54B3E-C2B6-4A9A-BA8D-BE20B9615476}']
    procedure doSendDataToSubLcd(b: Byte; b1: TJavaArray<Byte>); cdecl;
  end;

  TJSubLcdCommon = class(TJavaGenericImport<JSubLcdCommonClass, JSubLcdCommon>)
  end;

  JBaseSubLcdClass = interface(JSubLcdCommonClass)
    ['{E15CBEE4-A1CC-4EC8-B4D4-1FFB50F95FD3}']
    { class }
    function doCreateBitmap(string_: JString; i: Integer; i1: Integer; i2: Integer): JBitmap; cdecl;
    { class }     function init: JBaseSubLcd; cdecl;
  end;

  [JavaSignature('com/android/sublcdlibrary/BaseSubLcd')]
  JBaseSubLcd = interface(JSubLcdCommon)
    ['{76AA81B2-85F7-4B6A-9EA9-F363DF8C9318}']
    procedure addOnSubCallback(onSubCallback: JOnSubCallback); cdecl;
    function doBitmapToByte(bitmap: JBitmap): TJavaArray<Byte>; cdecl;
    function doReadBitmatToBytes(bitmap: JBitmap): TJavaArray<Byte>; cdecl;
    function doReadByteFromStream(inputStream: JInputStream): TJavaArray<Byte>; cdecl;
    function doResizeBitmap(bitmap: JBitmap; f: Single): JBitmap; cdecl; overload;
    function doResizeBitmap(bitmap: JBitmap; i: Integer; i1: Integer): JBitmap; cdecl; overload;
    procedure doSendDataToSubLcd(b: Byte; b1: TJavaArray<Byte>); cdecl;
    procedure removeSubCallback; cdecl;
  end;

  TJBaseSubLcd = class(TJavaGenericImport<JBaseSubLcdClass, JBaseSubLcd>)
  end;

  JBaseSubLcd_MyReceiverClass = interface(JBroadcastReceiverClass)
    ['{1D8DF26D-F37F-4823-A827-71D06972E034}']
  end;

  [JavaSignature('com/android/sublcdlibrary/BaseSubLcd$MyReceiver')]
  JBaseSubLcd_MyReceiver = interface(JBroadcastReceiver)
    ['{E97FEFA3-340D-45BF-A51C-6E15C19899C6}']
    function _Getthis: JBaseSubLcd; cdecl;
    procedure onReceive(context: JContext; intent: JIntent); cdecl;
    // property this $0: JBaseSubLcd read _Getthis $0;
  end;

  TJBaseSubLcd_MyReceiver = class(TJavaGenericImport<JBaseSubLcd_MyReceiverClass, JBaseSubLcd_MyReceiver>)
  end;

  JOnSubCallbackClass = interface(IJavaClass)
    ['{468635FE-F739-455A-A6C6-2A0D413E51C2}']
  end;

  [JavaSignature('com/android/sublcdlibrary/OnSubCallback')]
  JOnSubCallback = interface(IJavaInstance)
    ['{D259948B-59E4-4812-BA8C-729AA73EA93F}']
    procedure onRecive(string_: JString); cdecl;
  end;

  TJOnSubCallback = class(TJavaGenericImport<JOnSubCallbackClass, JOnSubCallback>)
  end;

  JRQCodeClass = interface(JObjectClass)
    ['{FE734E0B-3530-4D46-9B13-918A506A21EC}']
    { class }
    function getRQCode(string_: JString): JBitmap; cdecl;
    { class }     function init: JRQCode; cdecl;
  end;

  [JavaSignature('com/android/sublcdlibrary/RQCode')]
  JRQCode = interface(JObject)
    ['{9F6CC873-912E-40E5-9A8C-258D5F8A3445}']
  end;

  TJRQCode = class(TJavaGenericImport<JRQCodeClass, JRQCode>)
  end;

  JReceiverDataServicesClass = interface(JServiceClass)
    ['{57876AA4-03C9-4C19-8341-A154E01D1989}']
    { class }
    function init: JReceiverDataServices; cdecl;
    { class }     procedure removeCallback; cdecl;
    { class }     procedure setOnSubCallback(onSubCallback: JOnSubCallback); cdecl;
    { class }     procedure startCallback; cdecl;
  end;

  [JavaSignature('com/android/sublcdlibrary/ReceiverDataServices')]
  JReceiverDataServices = interface(JService)
    ['{4C3E0523-4F98-40A7-B1D1-032EAF0464DA}']
    function onBind(intent: JIntent): JIBinder; cdecl;
    procedure onCreate; cdecl;
  end;

  TJReceiverDataServices = class(TJavaGenericImport<JReceiverDataServicesClass, JReceiverDataServices>)
  end;

  // com.android.sublcdlibrary.ReceiverDataServices$1
  JReceiverDataServices_LocalBinderClass = interface(JBinderClass)
    ['{645BC905-3A9B-46E8-A6E2-84EC08F19BBC}']
    { class }
    function init(receiverDataServices: JReceiverDataServices): JReceiverDataServices_LocalBinder; cdecl;
  end;

  [JavaSignature('com/android/sublcdlibrary/ReceiverDataServices$LocalBinder')]
  JReceiverDataServices_LocalBinder = interface(JBinder)
    ['{464B6959-359B-44F9-91FA-CBB706AEB31B}']
    function _Getthis: JReceiverDataServices; cdecl;
    function getService: JReceiverDataServices; cdecl;
    // property this $0: JReceiverDataServices read _Getthis $0;
  end;

  TJReceiverDataServices_LocalBinder = class(TJavaGenericImport<JReceiverDataServices_LocalBinderClass, JReceiverDataServices_LocalBinder>)
  end;

  JSubLcdConstantClass = interface(JObjectClass)
    ['{1E842B7F-7F96-400F-A7C5-D5FDDA31EF05}']
    { class }
    function _GetCMD_PROTOCAL_STOP_SCAN: Byte; cdecl;
    { class }     function _GetCMD_PROTOCOL_BACKLIGHT: Byte; cdecl;
    { class }     function _GetCMD_PROTOCOL_BMP_DISPLAY: Byte; cdecl;
    { class }     function _GetCMD_PROTOCOL_CLOSE_TAX: Byte; cdecl;
    { class }     function _GetCMD_PROTOCOL_DEFAULT: Byte; cdecl;
    { class }     function _GetCMD_PROTOCOL_FILE_NAME: Byte; cdecl;
    { class }     function _GetCMD_PROTOCOL_HEARTBEAT: Byte; cdecl;
    { class }     function _GetCMD_PROTOCOL_OPEN_TAX: Byte; cdecl;
    { class }     function _GetCMD_PROTOCOL_START_SCAN: Byte; cdecl;
    { class }     function _GetCMD_PROTOCOL_SUSPEND: Byte; cdecl;
    { class }     function _GetCMD_PROTOCOL_TEST: Byte; cdecl;
    { class }     function _GetCMD_PROTOCOL_UPDATE: Byte; cdecl;
    { class }     function _GetCMD_PROTOCOL_VERSION: Byte; cdecl;
    { class }     function _GetCMD_SUBLCD_LOG: Byte; cdecl;
    { class }     function _GetCMD_SUBLCD_LOGO: Byte; cdecl;
    { class }     function _GetCMD_SUBLCD_TEST_VERSION: Byte; cdecl;
    { class }     function _GetDEBUG_SUBLCD: Boolean; cdecl;
    { class }     function _GetDEFAULT_SUBLCD_HEIGHT: Integer; cdecl;
    { class }     function _GetDEFAULT_SUBLCD_WIDTH: Integer; cdecl;
    { class }     function _GetEVENT_PATH: JString; cdecl;
    { class }     function _GetFLAG_SUBLCD_RECEIVE_START: Byte; cdecl;
    { class }     function _GetFLAG_SUBLCD_START: Byte; cdecl;
    { class }     function _GetFLAG_SUBLCD_STOP: Byte; cdecl;
    { class }     function _GetMAX_DATA_LOG_RETRY_TIMES: Integer; cdecl;
    { class }     function _GetMAX_DATA_READ_RETRY_TIMES: Integer; cdecl;
    { class }     function _GetMAX_DATA_SCAN_RETRY_TIMES: Integer; cdecl;
    { class }     function _GetMAX_DATA_SEND_RETRY_TIMES: Integer; cdecl;
    { class }     function _GetMAX_SUBLCD_TRANSFER_LEN: Integer; cdecl;
    { class }     function _GetSERIAL_PORT_REPLY_FAIL: Integer; cdecl;
    { class }     function _GetSERIAL_PORT_REPLY_PASS: Integer; cdecl;
    { class }     function _GetSPI_PATH: JString; cdecl;
    { class }     function _GetSUBLCD_DISPLAY_TEXT_SIZE: Integer; cdecl;
    { class }     function init: JSubLcdConstant; cdecl; // Deprecated
    { class }
    property CMD_PROTOCAL_STOP_SCAN: Byte read _GetCMD_PROTOCAL_STOP_SCAN;
    { class }     property CMD_PROTOCOL_BACKLIGHT: Byte read _GetCMD_PROTOCOL_BACKLIGHT;
    { class }     property CMD_PROTOCOL_BMP_DISPLAY: Byte read _GetCMD_PROTOCOL_BMP_DISPLAY;
    { class }     property CMD_PROTOCOL_CLOSE_TAX: Byte read _GetCMD_PROTOCOL_CLOSE_TAX;
    { class }     property CMD_PROTOCOL_DEFAULT: Byte read _GetCMD_PROTOCOL_DEFAULT;
    { class }     property CMD_PROTOCOL_FILE_NAME: Byte read _GetCMD_PROTOCOL_FILE_NAME;
    { class }     property CMD_PROTOCOL_HEARTBEAT: Byte read _GetCMD_PROTOCOL_HEARTBEAT;
    { class }     property CMD_PROTOCOL_OPEN_TAX: Byte read _GetCMD_PROTOCOL_OPEN_TAX;
    { class }     property CMD_PROTOCOL_START_SCAN: Byte read _GetCMD_PROTOCOL_START_SCAN;
    { class }     property CMD_PROTOCOL_SUSPEND: Byte read _GetCMD_PROTOCOL_SUSPEND;
    { class }     property CMD_PROTOCOL_TEST: Byte read _GetCMD_PROTOCOL_TEST;
    { class }     property CMD_PROTOCOL_UPDATE: Byte read _GetCMD_PROTOCOL_UPDATE;
    { class }     property CMD_PROTOCOL_VERSION: Byte read _GetCMD_PROTOCOL_VERSION;
    { class }     property CMD_SUBLCD_LOG: Byte read _GetCMD_SUBLCD_LOG;
    { class }     property CMD_SUBLCD_LOGO: Byte read _GetCMD_SUBLCD_LOGO;
    { class }     property CMD_SUBLCD_TEST_VERSION: Byte read _GetCMD_SUBLCD_TEST_VERSION;
    { class }     property DEBUG_SUBLCD: Boolean read _GetDEBUG_SUBLCD;
    { class }     property DEFAULT_SUBLCD_HEIGHT: Integer read _GetDEFAULT_SUBLCD_HEIGHT;
    { class }     property DEFAULT_SUBLCD_WIDTH: Integer read _GetDEFAULT_SUBLCD_WIDTH;
    { class }     property EVENT_PATH: JString read _GetEVENT_PATH;
    { class }     property FLAG_SUBLCD_RECEIVE_START: Byte read _GetFLAG_SUBLCD_RECEIVE_START;
    { class }     property FLAG_SUBLCD_START: Byte read _GetFLAG_SUBLCD_START;
    { class }     property FLAG_SUBLCD_STOP: Byte read _GetFLAG_SUBLCD_STOP;
    { class }     property MAX_DATA_LOG_RETRY_TIMES: Integer read _GetMAX_DATA_LOG_RETRY_TIMES;
    { class }     property MAX_DATA_READ_RETRY_TIMES: Integer read _GetMAX_DATA_READ_RETRY_TIMES;
    { class }     property MAX_DATA_SCAN_RETRY_TIMES: Integer read _GetMAX_DATA_SCAN_RETRY_TIMES;
    { class }     property MAX_DATA_SEND_RETRY_TIMES: Integer read _GetMAX_DATA_SEND_RETRY_TIMES;
    { class }     property MAX_SUBLCD_TRANSFER_LEN: Integer read _GetMAX_SUBLCD_TRANSFER_LEN;
    { class }     property SERIAL_PORT_REPLY_FAIL: Integer read _GetSERIAL_PORT_REPLY_FAIL;
    { class }     property SERIAL_PORT_REPLY_PASS: Integer read _GetSERIAL_PORT_REPLY_PASS;
    { class }     property SPI_PATH: JString read _GetSPI_PATH;
    { class }     property SUBLCD_DISPLAY_TEXT_SIZE: Integer read _GetSUBLCD_DISPLAY_TEXT_SIZE;
  end;

  [JavaSignature('com/android/sublcdlibrary/SubLcdConstant')]
  JSubLcdConstant = interface(JObject)
    ['{F1788C4E-D71F-456B-A7EE-62254E4D407A}']
  end;

  TJSubLcdConstant = class(TJavaGenericImport<JSubLcdConstantClass, JSubLcdConstant>)
  end;

  JSubLcdExceptionClass = interface(JExceptionClass)
    ['{B216E597-19E6-4208-A31D-45CB2A2C1D9A}']
    { class }
    function init: JSubLcdException; cdecl; overload;
    { class }     function init(throwable: JThrowable): JSubLcdException; cdecl; overload;
    { class }     function init(string_: JString): JSubLcdException; cdecl; overload;
    { class }     function init(string_: JString; throwable: JThrowable): JSubLcdException; cdecl; overload;
  end;

  [JavaSignature('com/android/sublcdlibrary/SubLcdException')]
  JSubLcdException = interface(JException)
    ['{46800E18-153E-4A95-B58C-E4945C63F659}']
  end;

  TJSubLcdException = class(TJavaGenericImport<JSubLcdExceptionClass, JSubLcdException>)
  end;

  JSubLcdHelperClass = interface(JBaseSubLcdClass)
    ['{D69352C7-56A2-4858-A75A-7156FF824976}']
    { class }
    function _GetSDK_VERSION: JString; cdecl;
    { class }     function _Getinstance: JSubLcdHelper; cdecl;
    { class }     procedure _Setinstance(value: JSubLcdHelper); cdecl;
    { class }     function getInstance: JSubLcdHelper; cdecl; // Deprecated
    { class }
    function init: JSubLcdHelper; cdecl; overload;
    { class }     property SDK_VERSION: JString read _GetSDK_VERSION;
    { class }     property instance: JSubLcdHelper read _Getinstance write _Setinstance;
  end;

  [JavaSignature('com/android/sublcdlibrary/SubLcdHelper')]
  JSubLcdHelper = interface(JBaseSubLcd)
    ['{9F05AA74-171A-4BF0-9E42-4222F19035D1}']
    procedure SetCalBack(vuleCalBack: JSubLcdHelper_VuleCalBack); cdecl;
    procedure contentToConvertQRCode(string_: JString); cdecl;
    function doRotateBitmap(bitmap: JBitmap; f: Single): JBitmap; cdecl;
    function getData: JString; cdecl;
    procedure getVersion; cdecl;
    function init(context: JContext): JSubLcdHelper; cdecl; overload;
    procedure onReplyData(subLcdReceiveData: JSubLcdUtils2_SubLcdReceiveData); cdecl;
    procedure onServiceConnected; cdecl;
    procedure readData; cdecl;
    procedure release; cdecl;
    procedure sendBacklightClose; cdecl;
    procedure sendBacklightOpen; cdecl;
    procedure sendBitmap(bitmap: JBitmap); cdecl;
    procedure sendScan; cdecl;
    procedure sendText(string_: JString; alignment: JLayout_Alignment; i: Integer); cdecl;
    procedure setCallback(onSubCallback: JOnSubCallback); cdecl;
    procedure updateFirmware(string_: JString; string_1: JString); cdecl;
    procedure updateFreshFirmware(string_: JString; string_1: JString); cdecl;
  end;

  TJSubLcdHelper = class(TJavaGenericImport<JSubLcdHelperClass, JSubLcdHelper>)
  end;

  JSubLcdHelper_VuleCalBackClass = interface(IJavaClass)
    ['{1798C4B0-3313-47B8-90E5-1E1E171D3455}']
  end;

  [JavaSignature('com/android/sublcdlibrary/SubLcdHelper$VuleCalBack')]
  JSubLcdHelper_VuleCalBack = interface(IJavaInstance)
    ['{0220E9F2-02CF-4121-911C-78E4A7BF8041}']
    procedure datatrigger(string_: JString; i: Integer); cdecl;
  end;

  TJSubLcdHelper_VuleCalBack = class(TJavaGenericImport<JSubLcdHelper_VuleCalBackClass, JSubLcdHelper_VuleCalBack>)
  end;

  JAP80_BuildConfigClass = interface(JObjectClass)
    ['{95768D6D-662D-4EA3-8DAE-2102497207E4}']
    { class }
    function _GetAPPLICATION_ID: JString; cdecl;
    { class }     function _GetBUILD_TYPE: JString; cdecl;
    { class }     function _GetDEBUG: Boolean; cdecl;
    { class }     function _GetFLAVOR: JString; cdecl;
    { class }     function _GetVERSION_CODE: Integer; cdecl;
    { class }     function _GetVERSION_NAME: JString; cdecl;
    { class }     function init: JAP80_BuildConfig; cdecl; // Deprecated
    { class }
    property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    { class }     property BUILD_TYPE: JString read _GetBUILD_TYPE;
    { class }     property DEBUG: Boolean read _GetDEBUG;
    { class }     property FLAVOR: JString read _GetFLAVOR;
    { class }     property VERSION_CODE: Integer read _GetVERSION_CODE;
    { class }     property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/elotouch/AP80/BuildConfig')]
  JAP80_BuildConfig = interface(JObject)
    ['{109DC5CC-B4FF-495E-A5D1-37730AF73ACA}']
  end;

  TJAP80_BuildConfig = class(TJavaGenericImport<JAP80_BuildConfigClass, JAP80_BuildConfig>)
  end;

  JIPrinterClass = interface(IJavaClass)
    ['{82B0F6E7-E572-4431-AA2D-9B52BF4F0E55}']
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/IPrinter')]
  JIPrinter = interface(IJavaInstance)
    ['{1B2C4BBF-20D5-4E06-BB95-675351EC4A88}']
    procedure clean; cdecl;
    procedure cutPaper(i: Integer); cdecl; overload;
    procedure cutPaper(i: Integer; i1: Integer); cdecl; overload;
    function getPrinterState(context: JContext): Integer; cdecl;
    function getSpeed: Integer; cdecl;
    procedure initPrint(context: JContext); cdecl;
    function isPrinterFilpOpen: Integer; cdecl;
    procedure lineFeed(i: Integer); cdecl;
    procedure printBarCode(string_: JString; i: Integer; i1: Integer; i2: Integer; i3: Integer; i4: Integer); cdecl;
    procedure printBitmap(bitmap: JBitmap; i: Integer; i1: Integer); cdecl; overload;
    procedure printBitmap(string_: JString; i: Integer; i1: Integer; i2: Integer); cdecl; overload;
    procedure printBitmap(string_: JString; i: Integer; i1: Integer; i2: Integer; i3: Integer); cdecl; overload;
    procedure printBitmapNew(bitmap: JBitmap; i: Integer; i1: Integer); cdecl;
    procedure printData(string_: JString; i: Integer; i1: Integer; b: Boolean; i2: Integer; i3: Integer; i4: Integer); cdecl;
    procedure printQRCode(string_: JString; i: Integer; i1: Integer); cdecl;
    procedure printQRCodeNew(string_: JString; i: Integer; i1: Integer); cdecl;
    procedure printStart; cdecl;
    procedure sendRawData(b: TJavaArray<Byte>); cdecl;
    procedure setPrintInch3of2(i: Integer); cdecl;
    procedure setSpeed(i: Integer); cdecl;
  end;

  TJIPrinter = class(TJavaGenericImport<JIPrinterClass, JIPrinter>)
  end;

  JAbstractPrinterClass = interface(JIPrinterClass)
    ['{1656934A-563C-41F5-BC44-953532134B60}']
    { class }
    function _GetTAG: JString; cdecl;
    { class }     function init: JAbstractPrinter; cdecl;
    { class }     property TAG: JString read _GetTAG;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/AbstractPrinter')]
  JAbstractPrinter = interface(JIPrinter)
    ['{123419F2-7519-4B90-A9A3-77D2D98DDC85}']
    procedure clean; cdecl;
    procedure cutPaper(i: Integer); cdecl; overload;
    procedure cutPaper(i: Integer; i1: Integer); cdecl; overload;
    function getContext: JContext; cdecl;
    function getPrinterState(context: JContext): Integer; cdecl;
    function getSpeed: Integer; cdecl;
    procedure initPrint(context: JContext); cdecl;
    function isPrinterFilpOpen: Integer; cdecl;
    procedure lineFeed(i: Integer); cdecl;
    procedure printBarCode(string_: JString; i: Integer; i1: Integer; i2: Integer; i3: Integer; i4: Integer); cdecl;
    procedure printBitmap(bitmap: JBitmap; i: Integer; i1: Integer); cdecl; overload;
    procedure printBitmap(string_: JString; i: Integer; i1: Integer; i2: Integer); cdecl; overload;
    procedure printBitmap(string_: JString; i: Integer; i1: Integer; i2: Integer; i3: Integer); cdecl; overload;
    procedure printBitmapNew(bitmap: JBitmap; i: Integer; i1: Integer); cdecl;
    procedure printData(string_: JString; i: Integer; i1: Integer; b: Boolean; i2: Integer; i3: Integer; i4: Integer); cdecl;
    procedure printQRCode(string_: JString; i: Integer; i1: Integer); cdecl;
    procedure printQRCodeNew(string_: JString; i: Integer; i1: Integer); cdecl;
    procedure printStart; cdecl;
    procedure sendRawData(b: TJavaArray<Byte>); cdecl;
    procedure setPrintInch3of2(i: Integer); cdecl;
    procedure setSpeed(i: Integer); cdecl;
  end;

  TJAbstractPrinter = class(TJavaGenericImport<JAbstractPrinterClass, JAbstractPrinter>)
  end;

  JInnerLcdCallbackClass = interface(JObjectClass)
    ['{DC3F209B-7EB1-444F-A726-9500D5794DD0}']
    { class }
    function init: JInnerLcdCallback; cdecl;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/InnerLcdCallback')]
  JInnerLcdCallback = interface(JObject)
    ['{F5AE401A-D10F-4A7D-ACDE-8EFA1BBCE56A}']
  end;

  TJInnerLcdCallback = class(TJavaGenericImport<JInnerLcdCallbackClass, JInnerLcdCallback>)
  end;

  JInnerPrinterCallbackClass = interface(JServiceConnectionClass)
    ['{2686BB91-9765-4F21-B97B-2B33A014DE3D}']
    { class }
    function init: JInnerPrinterCallback; cdecl;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/InnerPrinterCallback')]
  JInnerPrinterCallback = interface(JServiceConnection)
    ['{2A86ADB6-2ADA-4D51-B48A-43DAFAE81FEB}']
    procedure onConnected(iPrinterService: JIPrinterService); cdecl;
    procedure onServiceConnected(componentName: JComponentName; iBinder: JIBinder); cdecl;
    procedure onServiceDisconnected(componentName: JComponentName); cdecl;
  end;

  TJInnerPrinterCallback = class(TJavaGenericImport<JInnerPrinterCallbackClass, JInnerPrinterCallback>)
  end;

  JInnerPrinterExceptionClass = interface(JRemoteExceptionClass)
    ['{4E359DB3-9EDD-4B9E-87D2-9DED05DAF596}']
    { class }
    function init(string_: JString): JInnerPrinterException; cdecl;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/InnerPrinterException')]
  JInnerPrinterException = interface(JRemoteException)
    ['{F6A49939-5814-4B64-9516-E1DCA8708E56}']
  end;

  TJInnerPrinterException = class(TJavaGenericImport<JInnerPrinterExceptionClass, JInnerPrinterException>)
  end;

  JInnerPrinterManagerClass = interface(JObjectClass)
    ['{BF8187BA-39EA-4397-AAFF-4DEC1E0FEBCC}']
    { class }
    function _GetPRINTER_PACKAGE: JString; cdecl;
    { class }     function getInstance: JInnerPrinterManager; cdecl;
    { class }     property PRINTER_PACKAGE: JString read _GetPRINTER_PACKAGE;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/InnerPrinterManager')]
  JInnerPrinterManager = interface(JObject)
    ['{09E4BFAA-22A5-40A1-8C55-9656B63FE5E2}']
    function bindService(context: JContext; innerPrinterCallback: JInnerPrinterCallback): Boolean; cdecl;
    procedure unBindService(context: JContext; innerPrinterCallback: JInnerPrinterCallback); cdecl;
  end;

  TJInnerPrinterManager = class(TJavaGenericImport<JInnerPrinterManagerClass, JInnerPrinterManager>)
  end;

  JInnerPrinterManager_1Class = interface(JObjectClass)
    ['{187195D8-7F2F-4012-A565-F5F2CF45D15A}']
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/InnerPrinterManager$1')]
  JInnerPrinterManager_1 = interface(JObject)
    ['{B5AB3786-8DCB-4389-9565-0E2219833270}']
  end;

  TJInnerPrinterManager_1 = class(TJavaGenericImport<JInnerPrinterManager_1Class, JInnerPrinterManager_1>)
  end;

  JInnerPrinterManager_SingletonContainerClass = interface(JObjectClass)
    ['{A2FDEF12-9044-4A14-92D2-C1E99A72F849}']
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/InnerPrinterManager$SingletonContainer')]
  JInnerPrinterManager_SingletonContainer = interface(JObject)
    ['{A00B6D32-B1CA-4F80-B5C4-24875E7BB369}']
  end;

  TJInnerPrinterManager_SingletonContainer = class(TJavaGenericImport<JInnerPrinterManager_SingletonContainerClass, JInnerPrinterManager_SingletonContainer>)
  end;

  JIPrinterCallback_StubClass = interface(JBinderClass)
    ['{E5699791-8C16-4216-8A89-86CB04DAE087}']
    { class }
    function _GetTRANSACTION_onLength: Integer; cdecl;
    { class }     function asInterface(iBinder: JIBinder): JIPrinterCallback; cdecl;
    { class }     function init: JIPrinterCallback_Stub; cdecl; // Deprecated
    { class }
    property TRANSACTION_onLength: Integer read _GetTRANSACTION_onLength;
  end;

  [JavaSignature('com/prints/printerservice/IPrinterCallback$Stub')]
  JIPrinterCallback_Stub = interface(JBinder)
    ['{ED36F4C7-87FC-47EA-AB22-5A31D16C5F7D}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;

  TJIPrinterCallback_Stub = class(TJavaGenericImport<JIPrinterCallback_StubClass, JIPrinterCallback_Stub>)
  end;

  JInnerResultCallbackClass = interface(JIPrinterCallback_StubClass)
    ['{40862706-EE2B-4F72-9DFE-04626FED8088}']
    { class }
    function init: JInnerResultCallback; cdecl;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/InnerResultCallback')]
  JInnerResultCallback = interface(JIPrinterCallback_Stub)
    ['{6B828DF5-4ACE-4407-9F76-3B5D9EC98E72}']
  end;

  TJInnerResultCallback = class(TJavaGenericImport<JInnerResultCallbackClass, JInnerResultCallback>)
  end;

  JPrinterConfigsClass = interface(JObjectClass)
    ['{2593A3A2-F2DB-439E-8332-A32DFD8A0FE7}']
    { class }
    function _GetCONFIG_DEBUG_SUPPORT: Boolean; cdecl;
    { class }     function _GetCONFIG_MCU_SUPPORT: Boolean; cdecl;
    { class }     function _GetCONFIG_NO_DIALOG_SUPPORT: Boolean; cdecl;
    { class }     function _GetCONFIG_PRINTER_BAR_FORMAT: Integer; cdecl;
    { class }     function _GetCONFIG_PRINTER_BAR_WIDTH: Integer; cdecl;
    { class }     function _GetCONFIG_PRINTER_CLOSED_DELAY: Int64; cdecl;
    { class }     function _GetCONFIG_PRINTER_FORCE_UPGRADE: Boolean; cdecl;
    { class }     function _GetCONFIG_PRINTER_HRI_POSITION: Integer; cdecl;
    { class }     function _GetCONFIG_PRINTER_LEVEL_DEFAULT: Integer; cdecl;
    { class }     function _GetCONFIG_PRINTER_NEVER_UPGRADE: Boolean; cdecl;
    { class }     function _GetCONFIG_PRINTER_PAPER_WIDTH: Integer; cdecl;
    { class }     function _GetCONFIG_PRINTER_QR_ERROR: Integer; cdecl;
    { class }     function _GetCONFIG_PRINTER_QR_SIZE: Integer; cdecl;
    { class }     function _GetCONFIG_PRINTER_TRANSFER_DELAY: Int64; cdecl;
    { class }     function _GetCONFIG_PRINTER_TRANSFER_LENGTH: Integer; cdecl;
    { class }     function _GetCONFIG_PRINTER_UPGRADE_DELAY: Int64; cdecl;
    { class }     function _GetCONFIG_PRINTER_VERSION_BOOTLOADER_DEFAULT: JString; cdecl;
    { class }     function _GetCONFIG_PRINTER_VERSION_FIRMWARE_DEFAULT: JString; cdecl;
    { class }     function _GetCONFIG_SOUNDS_SUPPORT: Boolean; cdecl;
    { class }     function _GetCONFIG_TYPEFACE_DEFAULT: JString; cdecl;
    { class }     function _GetCONFIG_WHITE_LIST_SUPPORT: Boolean; cdecl;
    { class }     function init: JPrinterConfigs; cdecl; // Deprecated
    { class }
    property CONFIG_DEBUG_SUPPORT: Boolean read _GetCONFIG_DEBUG_SUPPORT;
    { class }     property CONFIG_MCU_SUPPORT: Boolean read _GetCONFIG_MCU_SUPPORT;
    { class }     property CONFIG_NO_DIALOG_SUPPORT: Boolean read _GetCONFIG_NO_DIALOG_SUPPORT;
    { class }     property CONFIG_PRINTER_BAR_FORMAT: Integer read _GetCONFIG_PRINTER_BAR_FORMAT;
    { class }     property CONFIG_PRINTER_BAR_WIDTH: Integer read _GetCONFIG_PRINTER_BAR_WIDTH;
    { class }     property CONFIG_PRINTER_CLOSED_DELAY: Int64 read _GetCONFIG_PRINTER_CLOSED_DELAY;
    { class }     property CONFIG_PRINTER_FORCE_UPGRADE: Boolean read _GetCONFIG_PRINTER_FORCE_UPGRADE;
    { class }     property CONFIG_PRINTER_HRI_POSITION: Integer read _GetCONFIG_PRINTER_HRI_POSITION;
    { class }     property CONFIG_PRINTER_LEVEL_DEFAULT: Integer read _GetCONFIG_PRINTER_LEVEL_DEFAULT;
    { class }     property CONFIG_PRINTER_NEVER_UPGRADE: Boolean read _GetCONFIG_PRINTER_NEVER_UPGRADE;
    { class }     property CONFIG_PRINTER_PAPER_WIDTH: Integer read _GetCONFIG_PRINTER_PAPER_WIDTH;
    { class }     property CONFIG_PRINTER_QR_ERROR: Integer read _GetCONFIG_PRINTER_QR_ERROR;
    { class }     property CONFIG_PRINTER_QR_SIZE: Integer read _GetCONFIG_PRINTER_QR_SIZE;
    { class }     property CONFIG_PRINTER_TRANSFER_DELAY: Int64 read _GetCONFIG_PRINTER_TRANSFER_DELAY;
    { class }     property CONFIG_PRINTER_TRANSFER_LENGTH: Integer read _GetCONFIG_PRINTER_TRANSFER_LENGTH;
    { class }     property CONFIG_PRINTER_UPGRADE_DELAY: Int64 read _GetCONFIG_PRINTER_UPGRADE_DELAY;
    { class }     property CONFIG_PRINTER_VERSION_BOOTLOADER_DEFAULT: JString read _GetCONFIG_PRINTER_VERSION_BOOTLOADER_DEFAULT;
    { class }     property CONFIG_PRINTER_VERSION_FIRMWARE_DEFAULT: JString read _GetCONFIG_PRINTER_VERSION_FIRMWARE_DEFAULT;
    { class }     property CONFIG_SOUNDS_SUPPORT: Boolean read _GetCONFIG_SOUNDS_SUPPORT;
    { class }     property CONFIG_TYPEFACE_DEFAULT: JString read _GetCONFIG_TYPEFACE_DEFAULT;
    { class }     property CONFIG_WHITE_LIST_SUPPORT: Boolean read _GetCONFIG_WHITE_LIST_SUPPORT;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/PrinterConfigs')]
  JPrinterConfigs = interface(JObject)
    ['{2D205DE0-9AA9-4035-BCD1-37CEEF143B6E}']
  end;

  TJPrinterConfigs = class(TJavaGenericImport<JPrinterConfigsClass, JPrinterConfigs>)
  end;

  JPrinterConstsClass = interface(IJavaClass)
    ['{5A0C3FCB-C00C-45DD-9059-50E8EF575DBA}']
    { class }
    function _GetDISABLE: Integer; cdecl;
    { class }     function _GetENABLE: Integer; cdecl;
    { class }     function _GetENABLE_ANTI_WHITE: Integer; cdecl;
    { class }     function _GetENABLE_BOLD: Integer; cdecl;
    { class }     function _GetENABLE_DOUBLE_HEIGHT: Integer; cdecl;
    { class }     function _GetENABLE_DOUBLE_WIDTH: Integer; cdecl;
    { class }     function _GetENABLE_ILALIC: Integer; cdecl;
    { class }     function _GetENABLE_INVERT: Integer; cdecl;
    { class }     function _GetENABLE_STRIKETHROUGH: Integer; cdecl;
    { class }     function _GetENABLE_UNDERLINE: Integer; cdecl;
    { class }     function _GetKEY_ALIGN: JString; cdecl;
    { class }     function _GetKEY_LINESPACE: JString; cdecl;
    { class }     function _GetKEY_MARGINBOTTOM: JString; cdecl;
    { class }     function _GetKEY_MARGINLEFT: JString; cdecl;
    { class }     function _GetKEY_MARGINRIGHT: JString; cdecl;
    { class }     function _GetKEY_MARGINTOP: JString; cdecl;
    { class }     function _GetKEY_PAPERWIDTH: JString; cdecl;
    { class }     function _GetKEY_TEXTSIZE: JString; cdecl;
    { class }     function _GetKEY_TYPEFACE: JString; cdecl;
    { class }     function _GetKEY_UNDERLINE: JString; cdecl;
    { class }     function _GetKEY_WEIGHT: JString; cdecl;
    { class }     function _GetSET_ABSOLUATE_POSITION: Integer; cdecl;
    { class }     function _GetSET_LEFT_SPACING: Integer; cdecl;
    { class }     function _GetSET_LINE_SPACING: Integer; cdecl;
    { class }     function _GetSET_PAPER_WIDTH: Integer; cdecl;
    { class }     function _GetSET_PAPER_WIDTH2: Integer; cdecl;
    { class }     function _GetSET_RELATIVE_POSITION: Integer; cdecl;
    { class }     function _GetSET_STRIKETHROUGH_STYLE: Integer; cdecl;
    { class }     function _GetSET_TEXT_RIGHT_SPACING: Integer; cdecl;
    { class }     property DISABLE: Integer read _GetDISABLE;
    { class }     property ENABLE: Integer read _GetENABLE;
    { class }     property ENABLE_ANTI_WHITE: Integer read _GetENABLE_ANTI_WHITE;
    { class }     property ENABLE_BOLD: Integer read _GetENABLE_BOLD;
    { class }     property ENABLE_DOUBLE_HEIGHT: Integer read _GetENABLE_DOUBLE_HEIGHT;
    { class }     property ENABLE_DOUBLE_WIDTH: Integer read _GetENABLE_DOUBLE_WIDTH;
    { class }     property ENABLE_ILALIC: Integer read _GetENABLE_ILALIC;
    { class }     property ENABLE_INVERT: Integer read _GetENABLE_INVERT;
    { class }     property ENABLE_STRIKETHROUGH: Integer read _GetENABLE_STRIKETHROUGH;
    { class }     property ENABLE_UNDERLINE: Integer read _GetENABLE_UNDERLINE;
    { class }     property KEY_ALIGN: JString read _GetKEY_ALIGN;
    { class }     property KEY_LINESPACE: JString read _GetKEY_LINESPACE;
    { class }     property KEY_MARGINBOTTOM: JString read _GetKEY_MARGINBOTTOM;
    { class }     property KEY_MARGINLEFT: JString read _GetKEY_MARGINLEFT;
    { class }     property KEY_MARGINRIGHT: JString read _GetKEY_MARGINRIGHT;
    { class }     property KEY_MARGINTOP: JString read _GetKEY_MARGINTOP;
    { class }     property KEY_PAPERWIDTH: JString read _GetKEY_PAPERWIDTH;
    { class }     property KEY_TEXTSIZE: JString read _GetKEY_TEXTSIZE;
    { class }     property KEY_TYPEFACE: JString read _GetKEY_TYPEFACE;
    { class }     property KEY_UNDERLINE: JString read _GetKEY_UNDERLINE;
    { class }     property KEY_WEIGHT: JString read _GetKEY_WEIGHT;
    { class }     property SET_ABSOLUATE_POSITION: Integer read _GetSET_ABSOLUATE_POSITION;
    { class }     property SET_LEFT_SPACING: Integer read _GetSET_LEFT_SPACING;
    { class }     property SET_LINE_SPACING: Integer read _GetSET_LINE_SPACING;
    { class }     property SET_PAPER_WIDTH: Integer read _GetSET_PAPER_WIDTH;
    { class }     property SET_PAPER_WIDTH2: Integer read _GetSET_PAPER_WIDTH2;
    { class }     property SET_RELATIVE_POSITION: Integer read _GetSET_RELATIVE_POSITION;
    { class }     property SET_STRIKETHROUGH_STYLE: Integer read _GetSET_STRIKETHROUGH_STYLE;
    { class }     property SET_TEXT_RIGHT_SPACING: Integer read _GetSET_TEXT_RIGHT_SPACING;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/PrinterConsts')]
  JPrinterConsts = interface(IJavaInstance)
    ['{E3A5BD40-2BBE-467C-B337-8FE7131EB7BA}']
  end;

  TJPrinterConsts = class(TJavaGenericImport<JPrinterConstsClass, JPrinterConsts>)
  end;

  JPrinterFactoryUtilsClass = interface(JObjectClass)
    ['{1A223C54-916B-4C22-B038-69F79FB51D1C}']
    { class }
    function getPrinter(context: JContext; i: Integer): JAbstractPrinter; cdecl;
    { class }     function init: JPrinterFactoryUtils; cdecl;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/PrinterFactoryUtils')]
  JPrinterFactoryUtils = interface(JObject)
    ['{526C252D-FD9C-4A74-86CB-A6F1DAA73E92}']
  end;

  TJPrinterFactoryUtils = class(TJavaGenericImport<JPrinterFactoryUtilsClass, JPrinterFactoryUtils>)
  end;

  JFormatAlignHelperClass = interface(JObjectClass)
    ['{AE0C7112-3B4B-4813-882B-67913D5362E8}']
    { class }
    function _GetALIGN_CENTER: Integer; cdecl;
    { class }     function _GetALIGN_LEFT: Integer; cdecl;
    { class }     function _GetALIGN_RIGHT: Integer; cdecl;
    { class }     function getAlign(i: Integer): JPaint_Align; cdecl;
    { class }     function init: JFormatAlignHelper; cdecl; // Deprecated
    { class }
    property ALIGN_CENTER: Integer read _GetALIGN_CENTER;
    { class }     property ALIGN_LEFT: Integer read _GetALIGN_LEFT;
    { class }     property ALIGN_RIGHT: Integer read _GetALIGN_RIGHT;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/format/FormatAlignHelper')]
  JFormatAlignHelper = interface(JObject)
    ['{A32DEE08-3A95-4EA5-BD19-ED89E7146F14}']
  end;

  TJFormatAlignHelper = class(TJavaGenericImport<JFormatAlignHelperClass, JFormatAlignHelper>)
  end;

  JPrinterAttributesClass = interface(JParcelableClass)
    ['{863850F6-4F3D-492A-8CE1-A2B898804AAC}']
    { class }
    function _GetABOVE: Integer; cdecl;
    { class }     function _GetBELOW: Integer; cdecl;
    { class }     function _GetCREATOR: JParcelable_Creator; cdecl;
    { class }     function _GetDEF_PRINTER_ATTRIBUTES_QRCODE_ERROR: Integer; cdecl;
    { class }     function _GetDEF_PRINTER_ATTRIBUTES_QRCODE_SAVE: Integer; cdecl;
    { class }     function _GetDEF_PRINTER_ATTRIBUTES_QRCODE_SIZE: Integer; cdecl;
    { class }     function _GetDEF_PRINTER_ATTRIBUTES_TEXTSIZE: Integer; cdecl;
    { class }     function _GetDEF_PRINTER_ATTRIBUTES_TYPEFACE: Integer; cdecl;
    { class }     function _GetHORIZONTAL: Integer; cdecl;
    { class }     function _GetKEY_ALIGN: JString; cdecl;
    { class }     function _GetKEY_BARALIGN: JString; cdecl;
    { class }     function _GetKEY_BARFORMAT: JString; cdecl;
    { class }     function _GetKEY_BARHEIGHT: JString; cdecl;
    { class }     function _GetKEY_BARHRIPOS: JString; cdecl;
    { class }     function _GetKEY_BARWIDTH: JString; cdecl;
    { class }     function _GetKEY_CODETABLE: JString; cdecl;
    { class }     function _GetKEY_DOUBLESTRIKE: JString; cdecl;
    { class }     function _GetKEY_FONT_TYPE: JString; cdecl;
    { class }     function _GetKEY_LETTERSPACING: JString; cdecl;
    { class }     function _GetKEY_LINESPACE: JString; cdecl;
    { class }     function _GetKEY_MARGINBOTTOM: JString; cdecl;
    { class }     function _GetKEY_MARGINLEFT: JString; cdecl;
    { class }     function _GetKEY_MARGINRIGHT: JString; cdecl;
    { class }     function _GetKEY_MARGINTOP: JString; cdecl;
    { class }     function _GetKEY_PAPERWIDTH: JString; cdecl;
    { class }     function _GetKEY_QRERROR: JString; cdecl;
    { class }     function _GetKEY_QRSAVE: JString; cdecl;
    { class }     function _GetKEY_QRSIZE: JString; cdecl;
    { class }     function _GetKEY_REVERSE: JString; cdecl;
    { class }     function _GetKEY_TEXTSCALEX: JString; cdecl;
    { class }     function _GetKEY_TEXTSIZE: JString; cdecl;
    { class }     function _GetKEY_TYPEFACE: JString; cdecl;
    { class }     function _GetKEY_UNDERLINE: JString; cdecl;
    { class }     function _GetKEY_WEIGHT: JString; cdecl;
    { class }     function _GetVERTICAL: Integer; cdecl;
    { class }     function clone(printerAttributes: JPrinterAttributes): JPrinterAttributes; cdecl;
    { class }     function init: JPrinterAttributes; cdecl; // Deprecated
    { class }
    function merge(printerAttributes: JPrinterAttributes; printerAttributes1: JPrinterAttributes): JPrinterAttributes; cdecl;
    { class }     property ABOVE: Integer read _GetABOVE;
    { class }     property BELOW: Integer read _GetBELOW;
    { class }     property CREATOR: JParcelable_Creator read _GetCREATOR;
    { class }     property DEF_PRINTER_ATTRIBUTES_QRCODE_ERROR: Integer read _GetDEF_PRINTER_ATTRIBUTES_QRCODE_ERROR;
    { class }     property DEF_PRINTER_ATTRIBUTES_QRCODE_SAVE: Integer read _GetDEF_PRINTER_ATTRIBUTES_QRCODE_SAVE;
    { class }     property DEF_PRINTER_ATTRIBUTES_QRCODE_SIZE: Integer read _GetDEF_PRINTER_ATTRIBUTES_QRCODE_SIZE;
    { class }     property DEF_PRINTER_ATTRIBUTES_TEXTSIZE: Integer read _GetDEF_PRINTER_ATTRIBUTES_TEXTSIZE;
    { class }     property DEF_PRINTER_ATTRIBUTES_TYPEFACE: Integer read _GetDEF_PRINTER_ATTRIBUTES_TYPEFACE;
    { class }     property HORIZONTAL: Integer read _GetHORIZONTAL;
    { class }     property KEY_ALIGN: JString read _GetKEY_ALIGN;
    { class }     property KEY_BARALIGN: JString read _GetKEY_BARALIGN;
    { class }     property KEY_BARFORMAT: JString read _GetKEY_BARFORMAT;
    { class }     property KEY_BARHEIGHT: JString read _GetKEY_BARHEIGHT;
    { class }     property KEY_BARHRIPOS: JString read _GetKEY_BARHRIPOS;
    { class }     property KEY_BARWIDTH: JString read _GetKEY_BARWIDTH;
    { class }     property KEY_CODETABLE: JString read _GetKEY_CODETABLE;
    { class }     property KEY_DOUBLESTRIKE: JString read _GetKEY_DOUBLESTRIKE;
    { class }     property KEY_FONT_TYPE: JString read _GetKEY_FONT_TYPE;
    { class }     property KEY_LETTERSPACING: JString read _GetKEY_LETTERSPACING;
    { class }     property KEY_LINESPACE: JString read _GetKEY_LINESPACE;
    { class }     property KEY_MARGINBOTTOM: JString read _GetKEY_MARGINBOTTOM;
    { class }     property KEY_MARGINLEFT: JString read _GetKEY_MARGINLEFT;
    { class }     property KEY_MARGINRIGHT: JString read _GetKEY_MARGINRIGHT;
    { class }     property KEY_MARGINTOP: JString read _GetKEY_MARGINTOP;
    { class }     property KEY_PAPERWIDTH: JString read _GetKEY_PAPERWIDTH;
    { class }     property KEY_QRERROR: JString read _GetKEY_QRERROR;
    { class }     property KEY_QRSAVE: JString read _GetKEY_QRSAVE;
    { class }     property KEY_QRSIZE: JString read _GetKEY_QRSIZE;
    { class }     property KEY_REVERSE: JString read _GetKEY_REVERSE;
    { class }     property KEY_TEXTSCALEX: JString read _GetKEY_TEXTSCALEX;
    { class }     property KEY_TEXTSIZE: JString read _GetKEY_TEXTSIZE;
    { class }     property KEY_TYPEFACE: JString read _GetKEY_TYPEFACE;
    { class }     property KEY_UNDERLINE: JString read _GetKEY_UNDERLINE;
    { class }     property KEY_WEIGHT: JString read _GetKEY_WEIGHT;
    { class }     property VERTICAL: Integer read _GetVERTICAL;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/format/PrinterAttributes')]
  JPrinterAttributes = interface(JParcelable)
    ['{95BB62D3-5356-4098-839A-301617CE8B79}']
    procedure applyHashMapValues(map: JMap); cdecl;
    function describeContents: Integer; cdecl;
    function getAlign: Integer; cdecl;
    function getBarcodeAlign: Integer; cdecl;
    function getBarcodeFormat: Integer; cdecl;
    function getBarcodeHRIPOS: Integer; cdecl;
    function getBarcodeHeight: Integer; cdecl;
    function getBarcodeWidth: Integer; cdecl;
    function getLetterSpacing: Single; cdecl;
    function getLinespace: Integer; cdecl;
    function getMarginBottom: Integer; cdecl;
    function getMarginLeft: Integer; cdecl;
    function getMarginRight: Integer; cdecl;
    function getMarginTop: Integer; cdecl;
    function getPaperwidth: Integer; cdecl;
    function getPrinterCodeType: Integer; cdecl;
    function getPrinterDoubleStrike: Boolean; cdecl;
    function getPrinterFontType: Integer; cdecl;
    function getPrinterReverse: Boolean; cdecl;
    function getQRCodeError: Integer; cdecl;
    function getQRCodeSave: Integer; cdecl;
    function getQRCodeSize: Integer; cdecl;
    function getTextScaleX: Single; cdecl;
    function getTextSize: Integer; cdecl;
    function getTypeface: Integer; cdecl;
    function getUnderline: Integer; cdecl;
    function getWeight: Integer; cdecl;
    procedure setAlign(i: Integer); cdecl;
    procedure setBarcodeAlign(i: Integer); cdecl;
    procedure setBarcodeFormat(i: Integer); cdecl;
    procedure setBarcodeHRIPOS(i: Integer); cdecl;
    procedure setBarcodeHeight(i: Integer); cdecl;
    procedure setBarcodeWidth(i: Integer); cdecl;
    procedure setDefaultAttributes; cdecl;
    procedure setLetterSpacing(f: Single); cdecl;
    procedure setLinespace(i: Integer); cdecl;
    procedure setMarginBottom(i: Integer); cdecl;
    procedure setMarginLeft(i: Integer); cdecl;
    procedure setMarginRight(i: Integer); cdecl;
    procedure setMarginTop(i: Integer); cdecl;
    procedure setPaperwidth(i: Integer); cdecl;
    procedure setPrinterCodeType(i: Integer); cdecl;
    procedure setPrinterDoubleStrike(b: Boolean); cdecl;
    procedure setPrinterFontType(i: Integer); cdecl;
    procedure setPrinterReverse(b: Boolean); cdecl;
    procedure setQRCodeError(i: Integer); cdecl;
    procedure setQRCodeSave(i: Integer); cdecl;
    procedure setQRCodeSize(i: Integer); cdecl;
    procedure setTextScaleX(f: Single); cdecl;
    procedure setTextSize(i: Integer); cdecl;
    procedure setTypeface(i: Integer); cdecl;
    procedure setUnderline(i: Integer); cdecl;
    procedure setWeight(i: Integer); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; i: Integer); cdecl;
  end;

  TJPrinterAttributes = class(TJavaGenericImport<JPrinterAttributesClass, JPrinterAttributes>)
  end;

  JPrinterAttributes_1Class = interface(JParcelable_CreatorClass)
    ['{F6805CE2-B5AA-4194-B142-A2AE3DD6BAB4}']
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/format/PrinterAttributes$1')]
  JPrinterAttributes_1 = interface(JParcelable_Creator)
    ['{8FC23B0A-4197-45D4-9B15-9D46A1A13DAD}']
    function createFromParcel(parcel: JParcel): JPrinterAttributes; cdecl;
    function newArray(i: Integer): TJavaObjectArray<JPrinterAttributes>; cdecl;
  end;

  TJPrinterAttributes_1 = class(TJavaGenericImport<JPrinterAttributes_1Class, JPrinterAttributes_1>)
  end;

  JContentHelperClass = interface(JObjectClass)
    ['{C47F5B7B-1F5C-42B9-B1FB-BEB1F86E17B3}']
    { class }
    function createTextViewBitmap(context: JContext; string_: JString; i: Integer; i1: Integer): JBitmap; cdecl;
    { class }     function createViewBitmap(view: JView): JBitmap; cdecl;
    { class }     function dip2px(context: JContext; f: Single): Integer; cdecl;
    { class }     function getTextPaintWidth(paint: JPaint; string_: JString): Single; cdecl;
    { class }     function init: JContentHelper; cdecl;
    { class }     function px2dip(context: JContext; f: Single): Integer; cdecl;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/text/ContentHelper')]
  JContentHelper = interface(JObject)
    ['{FABF5141-DC5C-4B15-9957-25EB8474D622}']
  end;

  TJContentHelper = class(TJavaGenericImport<JContentHelperClass, JContentHelper>)
  end;

  JPrinterViewManagerClass = interface(JObjectClass)
    ['{9CDBC989-5985-437C-95FC-FE597E6BD95F}']
    { class }
    function _GetATTRIBUTES_NULL: Integer; cdecl;
    { class }     function BitmapToBinaryzationBytes(bitmap: JBitmap): TJavaArray<Byte>; cdecl;
    { class }     function CombBitmap(bitmap: JBitmap; bitmap1: JBitmap; i: Integer): JBitmap; cdecl;
    { class }     function CreateBarcodeBitmap(string_: JString; i: Integer; i1: Integer): JBitmap; cdecl;
    { class }     function CreatePrinterBarcodeBitmap(string_: JString; i: Integer; i1: Integer; i2: Integer): JBitmap; cdecl;
    { class }     function CreatePrinterQrBitmap(string_: JString; i: Integer): JBitmap; cdecl;
    { class }     function CreateQrBitmap(string_: JString; i: Integer; string_1: JString): JBitmap; cdecl;
    { class }     function CreateRasterBitmap(bitmap: JBitmap): TJavaArray<Byte>; cdecl;
    { class }     function StringToBitmap(string_: JString; i: Integer; i1: Integer): JBitmap; cdecl;
    { class }     function createPrinterBarCodeBytes(context: JContext; string_: JString; i: Integer; i1: Integer; i2: Integer; i3: Integer; i4: Integer): TJavaArray<Byte>; cdecl;
    { class }     function createPrinterBitmapBytes(context: JContext; printerAttributes: JPrinterAttributes; bitmap: JBitmap): TJavaArray<Byte>; cdecl;
    { class }     function createPrinterBitmapBytesWidth(context: JContext; printerAttributes: JPrinterAttributes; bitmap: JBitmap): TJavaArray<Byte>; cdecl;
    { class }     function createPrinterQRCodeBytes(string_: JString; i: Integer; i1: Integer): TJavaArray<Byte>; cdecl; overload;
    { class }     function createPrinterQRCodeBytes(string_: JString; i: Integer; i1: Integer; i2: Integer): TJavaArray<Byte>; cdecl; overload;
    { class }     function createPrinterTextBytes(context: JContext; string_: JString): TJavaArray<Byte>; cdecl; overload;
    { class }     function createPrinterTextBytes(context: JContext; printerAttributes: JPrinterAttributes; string_: JString): TJavaArray<Byte>; cdecl; overload;
    { class }     function createPrinterTextBytes(context: JContext; printerAttributes: JPrinterAttributes; string_: JString; typeface: JTypeface): TJavaArray<Byte>; cdecl; overload;
    { class }     function createPrinterTextBytes(context: JContext; string_: TJavaObjectArray<JString>; i: TJavaArray<Integer>; i1: TJavaArray<Integer>): TJavaArray<Byte>; cdecl; overload;
    { class }     function createPrinterTextBytes(context: JContext; printerAttributes: TJavaObjectArray<JPrinterAttributes>; string_: TJavaObjectArray<JString>; b: Boolean): TJavaArray<Byte>; cdecl; overload;
    { class }     function createPrinterTextWithFont(context: JContext; i: Integer; i1: Integer; string_: JString): TJavaArray<Byte>; cdecl;
    { class }     function getNewWidth(i: Integer; string_: JString): Integer; cdecl;
    { class }     function init: JPrinterViewManager; cdecl;
    { class }     procedure setAlign(i: Integer); cdecl;
    { class }     procedure setFontSize(i: Integer); cdecl;
    { class }     procedure setPrinterStyle(string_: JString; i: Integer); cdecl;
    { class }     property ATTRIBUTES_NULL: Integer read _GetATTRIBUTES_NULL;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/text/PrinterViewManager')]
  JPrinterViewManager = interface(JObject)
    ['{E4865CB5-3F17-4C6E-9B99-D8BEC8E061D7}']
  end;

  TJPrinterViewManager = class(TJavaGenericImport<JPrinterViewManagerClass, JPrinterViewManager>)
  end;

  Jutils_FileUtilsClass = interface(JObjectClass)
    ['{EB6449C8-7EDC-4587-987D-691571EB4934}']
    { class }
    function _GetDEFAULT_QRCODE_DATA_FILE: JString; cdecl;
    { class }     function init: Jutils_FileUtils; cdecl;
    { class }     function readByteFromFile(string_: JString): TJavaArray<Byte>; cdecl;
    { class }     procedure saveBitmap(bitmap: JBitmap; string_: JString); cdecl;
    { class }     procedure writeByteToFile(b: TJavaArray<Byte>; string_: JString; b1: Boolean); cdecl;
    { class }     procedure writeStringToFile(string_: JString; string_1: JString; b: Boolean); cdecl;
    { class }     property DEFAULT_QRCODE_DATA_FILE: JString read _GetDEFAULT_QRCODE_DATA_FILE;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/utils/FileUtils')]
  Jutils_FileUtils = interface(JObject)
    ['{42CEF9BD-5939-4956-9271-BED4AD27F910}']
  end;

  TJutils_FileUtils = class(TJavaGenericImport<Jutils_FileUtilsClass, Jutils_FileUtils>)
  end;

  JStringUtilsClass = interface(JObjectClass)
    ['{899337F1-77FE-496D-857F-8EE909EE2DCD}']
    { class }
    function _GetBLANK_SPACE: JString; cdecl;
    { class }     function _GetLINE_FEED: JString; cdecl;
    { class }     function byteToString(b: Byte): JString; cdecl;
    { class }     function doAutoLineFeed(string_: JString; i: Integer): JString; cdecl;
    { class }     function doRemoveBlank(string_: JString): JString; cdecl;
    { class }     function init: JStringUtils; cdecl; // Deprecated
    { class }
    property BLANK_SPACE: JString read _GetBLANK_SPACE;
    { class }     property LINE_FEED: JString read _GetLINE_FEED;
  end;

  [JavaSignature('com/elotouch/AP80/printerlibrary/utils/StringUtils')]
  JStringUtils = interface(JObject)
    ['{4D0BB0CD-9E60-4B65-B752-695C813DBDCE}']
  end;

  TJStringUtils = class(TJavaGenericImport<JStringUtilsClass, JStringUtils>)
  end;

  JAP80PrintHelperClass = interface(JAbstractPrinterClass)
    ['{9087822F-C6FD-43C9-81E7-8B049E5FF574}']
    { class }
    function _GetkozenPrinter: Integer; cdecl;
    { class }     function _GetmIPrinterService: JIPrinterService; cdecl;
    { class }     procedure _SetmIPrinterService(value: JIPrinterService); cdecl;
    { class }     function getInstance: JAP80PrintHelper; cdecl;
    { class }     function init: JAP80PrintHelper; cdecl; // Deprecated
    { class }
    property kozenPrinter: Integer read _GetkozenPrinter;
    { class }     property mIPrinterService: JIPrinterService read _GetmIPrinterService write _SetmIPrinterService;
  end;

  [JavaSignature('com/elotouch/AP80/sdkhelper/AP80PrintHelper')]
  JAP80PrintHelper = interface(JAbstractPrinter)
    ['{33231E7C-9E31-4544-B617-73AF20E2F0C1}']
    procedure cutPaper(i: Integer); cdecl; overload;
    procedure cutPaper(i: Integer; i1: Integer); cdecl; overload;
    function getPrinterState(context: JContext): Integer; cdecl;
    function getSpeed: Integer; cdecl;
    procedure initPrint(context: JContext); cdecl;
    function isPrinterFilpOpen: Integer; cdecl;
    procedure lineFeed(i: Integer); cdecl;
    procedure printBarCode(string_: JString; i: Integer; i1: Integer; i2: Integer; i3: Integer; i4: Integer); cdecl;
    procedure printBitmap(bitmap: JBitmap; i: Integer; i1: Integer); cdecl;
    procedure printData(string_: JString; i: Integer; i1: Integer; b: Boolean; i2: Integer; i3: Integer; i4: Integer); cdecl;
    procedure printQRCode(string_: JString; i: Integer; i1: Integer); cdecl;
    procedure printStart; cdecl;
    procedure printTextWithAttributes(string_: JString; map: JMap); cdecl;
    procedure sendRawData(b: TJavaArray<Byte>); cdecl;
    procedure setSpeed(i: Integer); cdecl;
  end;

  TJAP80PrintHelper = class(TJavaGenericImport<JAP80PrintHelperClass, JAP80PrintHelper>)
  end;

  JAP80PrintHelper_1Class = interface(JInnerPrinterCallbackClass)
    ['{775B9CB5-C198-4365-A904-F7D56441D904}']
    { class }
    function init(aP80PrintHelper: JAP80PrintHelper): JAP80PrintHelper_1; cdecl;
  end;

  [JavaSignature('com/elotouch/AP80/sdkhelper/AP80PrintHelper$1')]
  JAP80PrintHelper_1 = interface(JInnerPrinterCallback)
    ['{61C802A0-FAE4-4913-B4FF-14132BFD683A}']
    function _Getthis: JAP80PrintHelper; cdecl;
    procedure onConnected(iPrinterService: JIPrinterService); cdecl;
    property this: JAP80PrintHelper read _Getthis;
  end;

  TJAP80PrintHelper_1 = class(TJavaGenericImport<JAP80PrintHelper_1Class, JAP80PrintHelper_1>)
  end;

  JAP80PrintHelper_2Class = interface(JIPrinterCallback_StubClass)
    ['{DA273E08-EF33-4A91-92CE-39636ED4501D}']
    { class }
    function init: JAP80PrintHelper_2; cdecl;
  end;

  [JavaSignature('com/elotouch/AP80/sdkhelper/AP80PrintHelper$2')]
  JAP80PrintHelper_2 = interface(JIPrinterCallback_Stub)
    ['{63EE90CE-EA74-4B08-B6D6-D2416A1A9F9E}']
    procedure onComplete; cdecl;
    procedure onException(i: Integer; string_: JString); cdecl;
    procedure onLength(l: Int64; l1: Int64); cdecl;
    procedure onStart; cdecl;
  end;

  TJAP80PrintHelper_2 = class(TJavaGenericImport<JAP80PrintHelper_2Class, JAP80PrintHelper_2>)
  end;

  JAP80PrintServiceClass = interface(JObjectClass)
    ['{E1F9FF43-C9FE-4561-BEDF-71A467D6784D}']
    { class }
    function getInstance: JAP80PrintService; cdecl;
    { class }     function init: JAP80PrintService; cdecl;
  end;

  [JavaSignature('com/elotouch/AP80/sdkhelper/AP80PrintService')]
  JAP80PrintService = interface(JObject)
    ['{23B1EA1E-6081-43E2-9695-0F3493A9AC1C}']
    procedure clean; cdecl;
    procedure cutPaper(i: Integer); cdecl; overload;
    procedure cutPaper(i: Integer; i1: Integer); cdecl; overload;
    function getPrinterState(context: JContext): Integer; cdecl;
    function getSpeed: Integer; cdecl;
    procedure initPrint(context: JContext); cdecl;
    function isPrinterFilpOpen: Integer; cdecl;
    procedure lineFeed(i: Integer); cdecl;
    procedure printBarCode(string_: JString; i: Integer; i1: Integer; i2: Integer; i3: Integer; i4: Integer); cdecl;
    procedure printBitmap(bitmap: JBitmap; i: Integer; i1: Integer); cdecl; overload;
    procedure printBitmap(string_: JString; i: Integer; i1: Integer; i2: Integer); cdecl; overload;
    procedure printBitmapNew(bitmap: JBitmap; i: Integer; i1: Integer); cdecl;
    procedure printData(string_: JString; i: Integer; i1: Integer; b: Boolean; i2: Integer; i3: Integer; i4: Integer); cdecl;
    procedure printQRCode(string_: JString; i: Integer; i1: Integer); cdecl;
    procedure printQRCodeNew(string_: JString; i: Integer; i1: Integer); cdecl;
    procedure printStart; cdecl;
    procedure sendRawData(b: TJavaArray<Byte>); cdecl;
    procedure setPrintInch3of2(i: Integer); cdecl;
    procedure setSpeed(i: Integer); cdecl;
  end;

  TJAP80PrintService = class(TJavaGenericImport<JAP80PrintServiceClass, JAP80PrintService>)
  end;

  JBytesUtilClass = interface(JObjectClass)
    ['{24483ADD-1098-4582-9A05-771E2978AA2F}']
    { class }
    function byteMerger(b: TJavaBiArray<Byte>): TJavaArray<Byte>; cdecl; overload;
    { class }     function byteMerger(b: TJavaArray<Byte>; b1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
    { class }     function customData: TJavaArray<Byte>; cdecl;
    { class }     function getBaiduTestBytes: TJavaArray<Byte>; cdecl;
    { class }     function getBytesFromBitMap(bitmap: JBitmap): TJavaArray<Byte>; cdecl; overload;
    { class }     function getBytesFromBitMap(bitmap: JBitmap; i: Integer): TJavaArray<Byte>; cdecl; overload;
    { class }     function getBytesFromBitMatrix(bitMatrix: JBitMatrix): TJavaArray<Byte>; cdecl;
    { class }     function getBytesFromDecString(string_: JString): TJavaArray<Byte>; cdecl;
    { class }     function getBytesFromHexString(string_: JString): TJavaArray<Byte>; cdecl;
    { class }     function getErlmoData: TJavaArray<Byte>; cdecl;
    { class }     function getHexStringFromBytes(b: TJavaArray<Byte>): JString; cdecl;
    { class }     function getKoubeiData: TJavaArray<Byte>; cdecl;
    { class }     function getMeituanBill: TJavaArray<Byte>; cdecl;
    { class }     function getZXingQRCode(string_: JString; i: Integer): TJavaArray<Byte>; cdecl;
    { class }     function init: JBytesUtil; cdecl;
    { class }     function initBlackBlock(i: Integer): TJavaArray<Byte>; cdecl; overload;
    { class }     function initBlackBlock(i: Integer; i1: Integer): TJavaArray<Byte>; cdecl; overload;
    { class }     function initTable(i: Integer; i1: Integer): TJavaArray<Byte>; cdecl;
    { class }     function wordData: TJavaArray<Byte>; cdecl;
  end;

  [JavaSignature('com/elotouch/AP80/utils/BytesUtil')]
  JBytesUtil = interface(JObject)
    ['{DE6E33CC-4BD8-47AA-8D80-F9F2455D0203}']
  end;

  TJBytesUtil = class(TJavaGenericImport<JBytesUtilClass, JBytesUtil>)
  end;

  JDeviceInfoUtilsClass = interface(JObjectClass)
    ['{3F85B579-4B33-4424-8E45-5AE3213BE1BB}']
    { class }
    function getBomInfo: JString; cdecl;
    { class }     function init: JDeviceInfoUtils; cdecl;
    { class }     procedure write(string_: JString; i: Integer); cdecl;
  end;

  [JavaSignature('com/elotouch/AP80/utils/DeviceInfoUtils')]
  JDeviceInfoUtils = interface(JObject)
    ['{A2F2A153-8943-47A7-94B9-C7EEFFBB97C3}']
  end;

  TJDeviceInfoUtils = class(TJavaGenericImport<JDeviceInfoUtilsClass, JDeviceInfoUtils>)
  end;

  JESCUtilClass = interface(JObjectClass)
    ['{1D502D9A-3945-4271-B02C-324E229533A1}']
    { class }
    function _GetCAN: Byte; cdecl;
    { class }     function _GetCASH_BOX_COMMAND: TJavaArray<Byte>; cdecl;
    { class }     function _GetCR: Byte; cdecl;
    { class }     function _GetDLE: Byte; cdecl;
    { class }     function _GetENQ: Byte; cdecl;
    { class }     function _GetEOT: Byte; cdecl;
    { class }     function _GetESC: Byte; cdecl;
    { class }     function _GetFF: Byte; cdecl;
    { class }     function _GetFS: Byte; cdecl;
    { class }     function _GetGS: Byte; cdecl;
    { class }     function _GetHT: Byte; cdecl;
    { class }     function _GetLF: Byte; cdecl;
    { class }     function _GetSP: Byte; cdecl;
    { class }     function Custom_CutPaper: TJavaArray<Byte>; cdecl;
    { class }     function FeedPaperCutAll: TJavaArray<Byte>; cdecl;
    { class }     function FeedPaperCutPartial: TJavaArray<Byte>; cdecl;
    { class }     function alignCenter: TJavaArray<Byte>; cdecl;
    { class }     function alignLeft: TJavaArray<Byte>; cdecl;
    { class }     function alignRight: TJavaArray<Byte>; cdecl;
    { class }     function boldOff: TJavaArray<Byte>; cdecl;
    { class }     function boldOn: TJavaArray<Byte>; cdecl;
    { class }     function cutter: TJavaArray<Byte>; cdecl;
    { class }     function getPrintBarCode(string_: JString; i: Integer; i1: Integer; i2: Integer; i3: Integer): TJavaArray<Byte>; cdecl;
    { class }     function getPrintDoubleQRCode(string_: JString; string_1: JString; i: Integer; i1: Integer): TJavaArray<Byte>; cdecl;
    { class }     function getPrintQRCode(string_: JString; i: Integer; i1: Integer): TJavaArray<Byte>; cdecl;
    { class }     function getPrintQRCode2(string_: JString; i: Integer): TJavaArray<Byte>; cdecl;
    { class }     function gogogo: TJavaArray<Byte>; cdecl;
    { class }     function init: JESCUtil; cdecl;
    { class }     function init_printer: TJavaArray<Byte>; cdecl;
    { class }     function nextLine(i: Integer): TJavaArray<Byte>; cdecl;
    { class }     function printBitmap(bitmap: JBitmap): TJavaArray<Byte>; cdecl; overload;
    { class }     function printBitmap(b: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
    { class }     function printBitmap(bitmap: JBitmap; i: Integer): TJavaArray<Byte>; cdecl; overload;
    { class }     function selectBitmap(bitmap: JBitmap; i: Integer): TJavaArray<Byte>; cdecl;
    { class }     function setCodeSystem(b: Byte): TJavaArray<Byte>; cdecl;
    { class }     function setCodeSystemSingle(b: Byte): TJavaArray<Byte>; cdecl;
    { class }     function setDefaultLineSpace: TJavaArray<Byte>; cdecl;
    { class }     function setLinespace(i: Integer): TJavaArray<Byte>; cdecl;
    { class }     function setPrinterDarkness(i: Integer): TJavaArray<Byte>; cdecl;
    { class }     function singleByte: TJavaArray<Byte>; cdecl;
    { class }     function singleByteOff: TJavaArray<Byte>; cdecl;
    { class }     function underlineOff: TJavaArray<Byte>; cdecl;
    { class }     function underlineWithOneDotWidthOn: TJavaArray<Byte>; cdecl;
    { class }     function underlineWithTwoDotWidthOn: TJavaArray<Byte>; cdecl;
    { class }     property CAN: Byte read _GetCAN;
    { class }     property CASH_BOX_COMMAND: TJavaArray<Byte> read _GetCASH_BOX_COMMAND;
    { class }     property CR: Byte read _GetCR;
    { class }     property DLE: Byte read _GetDLE;
    { class }     property ENQ: Byte read _GetENQ;
    { class }     property EOT: Byte read _GetEOT;
    { class }     property ESC: Byte read _GetESC;
    { class }     property FF: Byte read _GetFF;
    { class }     property FS: Byte read _GetFS;
    { class }     property GS: Byte read _GetGS;
    { class }     property HT: Byte read _GetHT;
    { class }     property LF: Byte read _GetLF;
    { class }     property SP: Byte read _GetSP;
  end;

  [JavaSignature('com/elotouch/AP80/utils/ESCUtil')]
  JESCUtil = interface(JObject)
    ['{94BBCDFA-8328-479C-AF60-394C9C007C74}']
  end;

  TJESCUtil = class(TJavaGenericImport<JESCUtilClass, JESCUtil>)
  end;

  JP80EscCommandClass = interface(JObjectClass)
    ['{9715C4C3-AFA0-40BE-BE80-707E4BFED240}']
    { class }
    function _GetALIGN_CENTER: Integer; cdecl;
    { class }     function _GetALIGN_LEFT: Integer; cdecl;
    { class }     function _GetALIGN_RIGHT: Integer; cdecl;
    { class }     function _GetDEBUG: Boolean; cdecl;
    { class }     function _GetDEFAULT_PAPER_WIDTH: Integer; cdecl;
    { class }     function _GetDEFAULT_TEXTSIZE: Integer; cdecl;
    { class }     function _GetESC: JString; cdecl;
    { class }     function _GetKEY_ALIGN: JString; cdecl;
    { class }     function _GetKEY_PAPER_WIDTH: JString; cdecl;
    { class }     function _GetKEY_TEXTSCALEX: JString; cdecl;
    { class }     function _GetKEY_TEXTSIZE: JString; cdecl;
    { class }     function _GetKEY_TYPEFACE: JString; cdecl;
    { class }     function _GetKEY_UNDERLINE: JString; cdecl;
    { class }     function _GetTAG: JString; cdecl;
    { class }     function _GetTYPEFACE_BOLD: Integer; cdecl;
    { class }     function _GetTYPEFACE_NORMAL: Integer; cdecl;
    { class }     function _GetTYPEFACE_SERIF: Integer; cdecl;
    { class }     function init: JP80EscCommand; cdecl; // Deprecated
    { class }
    property ALIGN_CENTER: Integer read _GetALIGN_CENTER;
    { class }     property ALIGN_LEFT: Integer read _GetALIGN_LEFT;
    { class }     property ALIGN_RIGHT: Integer read _GetALIGN_RIGHT;
    { class }     property DEBUG: Boolean read _GetDEBUG;
    { class }     property DEFAULT_PAPER_WIDTH: Integer read _GetDEFAULT_PAPER_WIDTH;
    { class }     property DEFAULT_TEXTSIZE: Integer read _GetDEFAULT_TEXTSIZE;
    { class }     property ESC: JString read _GetESC;
    { class }     property KEY_ALIGN: JString read _GetKEY_ALIGN;
    { class }     property KEY_PAPER_WIDTH: JString read _GetKEY_PAPER_WIDTH;
    { class }     property KEY_TEXTSCALEX: JString read _GetKEY_TEXTSCALEX;
    { class }     property KEY_TEXTSIZE: JString read _GetKEY_TEXTSIZE;
    { class }     property KEY_TYPEFACE: JString read _GetKEY_TYPEFACE;
    { class }     property KEY_UNDERLINE: JString read _GetKEY_UNDERLINE;
    { class }     property TAG: JString read _GetTAG;
    { class }     property TYPEFACE_BOLD: Integer read _GetTYPEFACE_BOLD;
    { class }     property TYPEFACE_NORMAL: Integer read _GetTYPEFACE_NORMAL;
    { class }     property TYPEFACE_SERIF: Integer read _GetTYPEFACE_SERIF;
  end;

  [JavaSignature('com/elotouch/AP80/utils/P80EscCommand')]
  JP80EscCommand = interface(JObject)
    ['{DD98D7ED-2E83-4505-9EB0-735EEB6A571F}']
  end;

  TJP80EscCommand = class(TJavaGenericImport<JP80EscCommandClass, JP80EscCommand>)
  end;

  JBarcodeFormatClass = interface(JEnumClass)
    ['{BF0599D3-A4FB-47D6-AE8C-91344AB361A0}']
    { class }
    function _GetAZTEC: JBarcodeFormat; cdecl;
    { class }     function _GetCODABAR: JBarcodeFormat; cdecl;
    { class }     function _GetCODE_128: JBarcodeFormat; cdecl;
    { class }     function _GetCODE_39: JBarcodeFormat; cdecl;
    { class }     function _GetCODE_93: JBarcodeFormat; cdecl;
    { class }     function _GetDATA_MATRIX: JBarcodeFormat; cdecl;
    { class }     function _GetEAN_13: JBarcodeFormat; cdecl;
    { class }     function _GetEAN_8: JBarcodeFormat; cdecl;
    { class }     function _GetITF: JBarcodeFormat; cdecl;
    { class }     function _GetMAXICODE: JBarcodeFormat; cdecl;
    { class }     function _GetPDF_417: JBarcodeFormat; cdecl;
    { class }     function _GetQR_CODE: JBarcodeFormat; cdecl;
    { class }     function _GetRSS_14: JBarcodeFormat; cdecl;
    { class }     function _GetRSS_EXPANDED: JBarcodeFormat; cdecl;
    { class }     function _GetUPC_A: JBarcodeFormat; cdecl;
    { class }     function _GetUPC_E: JBarcodeFormat; cdecl;
    { class }     function _GetUPC_EAN_EXTENSION: JBarcodeFormat; cdecl;
    { class }     function valueOf(string_: JString): JBarcodeFormat; cdecl;
    { class }     function values: TJavaObjectArray<JBarcodeFormat>; cdecl;
    // Deprecated
    { class }     property AZTEC: JBarcodeFormat read _GetAZTEC;
    { class }     property CODABAR: JBarcodeFormat read _GetCODABAR;
    { class }     property CODE_128: JBarcodeFormat read _GetCODE_128;
    { class }     property CODE_39: JBarcodeFormat read _GetCODE_39;
    { class }     property CODE_93: JBarcodeFormat read _GetCODE_93;
    { class }     property DATA_MATRIX: JBarcodeFormat read _GetDATA_MATRIX;
    { class }     property EAN_13: JBarcodeFormat read _GetEAN_13;
    { class }     property EAN_8: JBarcodeFormat read _GetEAN_8;
    { class }     property ITF: JBarcodeFormat read _GetITF;
    { class }     property MAXICODE: JBarcodeFormat read _GetMAXICODE;
    { class }     property PDF_417: JBarcodeFormat read _GetPDF_417;
    { class }     property QR_CODE: JBarcodeFormat read _GetQR_CODE;
    { class }     property RSS_14: JBarcodeFormat read _GetRSS_14;
    { class }     property RSS_EXPANDED: JBarcodeFormat read _GetRSS_EXPANDED;
    { class }     property UPC_A: JBarcodeFormat read _GetUPC_A;
    { class }     property UPC_E: JBarcodeFormat read _GetUPC_E;
    { class }     property UPC_EAN_EXTENSION: JBarcodeFormat read _GetUPC_EAN_EXTENSION;
  end;

  [JavaSignature('com/google/zxing/BarcodeFormat')]
  JBarcodeFormat = interface(JEnum)
    ['{1199761D-CD8E-409D-9F06-DCCD0B1253E2}']
  end;

  TJBarcodeFormat = class(TJavaGenericImport<JBarcodeFormatClass, JBarcodeFormat>)
  end;

  JBinarizerClass = interface(JObjectClass)
    ['{EEA3EAD9-C2AA-4403-AD6F-00792992B1CB}']
    { class }
    function init(luminanceSource: JLuminanceSource): JBinarizer; cdecl;
  end;

  [JavaSignature('com/google/zxing/Binarizer')]
  JBinarizer = interface(JObject)
    ['{A8C8C5B1-17BD-4F2C-BC86-88DEA6EC1D0B}']
    function createBinarizer(luminanceSource: JLuminanceSource): JBinarizer; cdecl;
    function getBlackMatrix: JBitMatrix; cdecl;
    function getBlackRow(i: Integer; bitArray: JBitArray): JBitArray; cdecl;
    function getHeight: Integer; cdecl;
    function getLuminanceSource: JLuminanceSource; cdecl;
    function getWidth: Integer; cdecl;
  end;

  TJBinarizer = class(TJavaGenericImport<JBinarizerClass, JBinarizer>)
  end;

  JBinaryBitmapClass = interface(JObjectClass)
    ['{16992B6F-1D20-4ECE-9702-31927F2A89BA}']
    { class }
    function init(binarizer: JBinarizer): JBinaryBitmap; cdecl;
  end;

  [JavaSignature('com/google/zxing/BinaryBitmap')]
  JBinaryBitmap = interface(JObject)
    ['{FDBDBFB1-D924-46EC-B229-43D4F1AC216F}']
    function crop(i: Integer; i1: Integer; i2: Integer; i3: Integer): JBinaryBitmap; cdecl;
    function getBlackMatrix: JBitMatrix; cdecl;
    function getBlackRow(i: Integer; bitArray: JBitArray): JBitArray; cdecl;
    function getHeight: Integer; cdecl;
    function getWidth: Integer; cdecl;
    function isCropSupported: Boolean; cdecl;
    function isRotateSupported: Boolean; cdecl;
    function rotateCounterClockwise: JBinaryBitmap; cdecl;
    function rotateCounterClockwise45: JBinaryBitmap; cdecl;
    function toString: JString; cdecl;
  end;

  TJBinaryBitmap = class(TJavaGenericImport<JBinaryBitmapClass, JBinaryBitmap>)
  end;

  JReaderExceptionClass = interface(JExceptionClass)
    ['{DCE54409-B37B-493C-A34D-9C3611446ADB}']
    { class }
    function _GetNO_TRACE: TJavaObjectArray<JStackTraceElement>; cdecl;
    { class }     function _GetisStackTrace: Boolean; cdecl;
    { class }     function init: JReaderException; cdecl; overload; // Deprecated
    { class }
    function init(throwable: JThrowable): JReaderException; cdecl; overload;
    { class }     procedure setStackTrace(b: Boolean); cdecl;
    { class }     property NO_TRACE: TJavaObjectArray<JStackTraceElement> read _GetNO_TRACE;
    { class }     property isStackTrace: Boolean read _GetisStackTrace;
  end;

  [JavaSignature('com/google/zxing/ReaderException')]
  JReaderException = interface(JException)
    ['{D05FBF70-F808-4701-95A3-6B093E63B8FD}']
    function fillInStackTrace: JThrowable; cdecl;
  end;

  TJReaderException = class(TJavaGenericImport<JReaderExceptionClass, JReaderException>)
  end;

  JChecksumExceptionClass = interface(JReaderExceptionClass)
    ['{EDF54BDB-9024-465A-9B1C-395478A70685}']
    { class }
    function getChecksumInstance: JChecksumException; cdecl; overload;
    { class }     function getChecksumInstance(throwable: JThrowable): JChecksumException; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/ChecksumException')]
  JChecksumException = interface(JReaderException)
    ['{34BDD53E-8C18-432B-B1A4-91E6CBB2EFDE}']
  end;

  TJChecksumException = class(TJavaGenericImport<JChecksumExceptionClass, JChecksumException>)
  end;

  JDecodeHintTypeClass = interface(JEnumClass)
    ['{E4FD5E95-B0C0-4300-9293-E059AB5E3A56}']
    { class }
    function _GetALLOWED_EAN_EXTENSIONS: JDecodeHintType; cdecl;
    { class }     function _GetALLOWED_LENGTHS: JDecodeHintType; cdecl;
    { class }     function _GetALSO_INVERTED: JDecodeHintType; cdecl;
    { class }     function _GetASSUME_CODE_39_CHECK_DIGIT: JDecodeHintType; cdecl;
    { class }     function _GetASSUME_GS1: JDecodeHintType; cdecl;
    { class }     function _GetCHARACTER_SET: JDecodeHintType; cdecl;
    { class }     function _GetNEED_RESULT_POINT_CALLBACK: JDecodeHintType; cdecl;
    { class }     function _GetOTHER: JDecodeHintType; cdecl;
    { class }     function _GetPOSSIBLE_FORMATS: JDecodeHintType; cdecl;
    { class }     function _GetPURE_BARCODE: JDecodeHintType; cdecl;
    { class }     function _GetRETURN_CODABAR_START_END: JDecodeHintType; cdecl;
    { class }     function _GetTRY_HARDER: JDecodeHintType; cdecl;
    { class }     function valueOf(string_: JString): JDecodeHintType; cdecl;
    { class }     function values: TJavaObjectArray<JDecodeHintType>; cdecl;
    // Deprecated
    { class }     property ALLOWED_EAN_EXTENSIONS: JDecodeHintType read _GetALLOWED_EAN_EXTENSIONS;
    { class }     property ALLOWED_LENGTHS: JDecodeHintType read _GetALLOWED_LENGTHS;
    { class }     property ALSO_INVERTED: JDecodeHintType read _GetALSO_INVERTED;
    { class }     property ASSUME_CODE_39_CHECK_DIGIT: JDecodeHintType read _GetASSUME_CODE_39_CHECK_DIGIT;
    { class }     property ASSUME_GS1: JDecodeHintType read _GetASSUME_GS1;
    { class }     property CHARACTER_SET: JDecodeHintType read _GetCHARACTER_SET;
    { class }     property NEED_RESULT_POINT_CALLBACK: JDecodeHintType read _GetNEED_RESULT_POINT_CALLBACK;
    { class }     property other: JDecodeHintType read _GetOTHER;
    { class }     property POSSIBLE_FORMATS: JDecodeHintType read _GetPOSSIBLE_FORMATS;
    { class }     property PURE_BARCODE: JDecodeHintType read _GetPURE_BARCODE;
    { class }     property RETURN_CODABAR_START_END: JDecodeHintType read _GetRETURN_CODABAR_START_END;
    { class }     property TRY_HARDER: JDecodeHintType read _GetTRY_HARDER;
  end;

  [JavaSignature('com/google/zxing/DecodeHintType')]
  JDecodeHintType = interface(JEnum)
    ['{18F3CA97-63EB-449E-AF06-580DF600AE66}']
    function getValueType: Jlang_Class; cdecl;
  end;

  TJDecodeHintType = class(TJavaGenericImport<JDecodeHintTypeClass, JDecodeHintType>)
  end;

  Jzxing_DimensionClass = interface(JObjectClass)
    ['{C90B5651-1806-4692-AE60-FFD7782ECD0A}']
    { class }
    function init(i: Integer; i1: Integer): Jzxing_Dimension; cdecl;
  end;

  [JavaSignature('com/google/zxing/Dimension')]
  Jzxing_Dimension = interface(JObject)
    ['{B1D258D8-6EDE-49A4-A61E-20E84747B968}']
    function equals(object_: JObject): Boolean; cdecl;
    function getHeight: Integer; cdecl;
    function getWidth: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;

  TJzxing_Dimension = class(TJavaGenericImport<Jzxing_DimensionClass, Jzxing_Dimension>)
  end;

  JEncodeHintTypeClass = interface(JEnumClass)
    ['{02349BCF-D94A-486E-855E-D9D2FF7A5105}']
    { class }
    function _GetAZTEC_LAYERS: JEncodeHintType; cdecl;
    { class }     function _GetCHARACTER_SET: JEncodeHintType; cdecl;
    { class }     function _GetCODE128_COMPACT: JEncodeHintType; cdecl;
    { class }     function _GetDATA_MATRIX_COMPACT: JEncodeHintType; cdecl;
    { class }     function _GetDATA_MATRIX_SHAPE: JEncodeHintType; cdecl;
    { class }     function _GetERROR_CORRECTION: JEncodeHintType; cdecl;
    { class }     function _GetFORCE_C40: JEncodeHintType; cdecl;
    { class }     function _GetFORCE_CODE_SET: JEncodeHintType; cdecl;
    { class }     function _GetGS1_FORMAT: JEncodeHintType; cdecl;
    { class }     function _GetMARGIN: JEncodeHintType; cdecl;
    { class }     function _GetMAX_SIZE: JEncodeHintType; cdecl;
    { class }     function _GetMIN_SIZE: JEncodeHintType; cdecl;
    { class }     function _GetPDF417_AUTO_ECI: JEncodeHintType; cdecl;
    { class }     function _GetPDF417_COMPACT: JEncodeHintType; cdecl;
    { class }     function _GetPDF417_COMPACTION: JEncodeHintType; cdecl;
    { class }     function _GetPDF417_DIMENSIONS: JEncodeHintType; cdecl;
    { class }     function _GetQR_COMPACT: JEncodeHintType; cdecl;
    { class }     function _GetQR_MASK_PATTERN: JEncodeHintType; cdecl;
    { class }     function _GetQR_VERSION: JEncodeHintType; cdecl;
    { class }     function valueOf(string_: JString): JEncodeHintType; cdecl;
    { class }     function values: TJavaObjectArray<JEncodeHintType>; cdecl;
    // Deprecated
    { class }     property AZTEC_LAYERS: JEncodeHintType read _GetAZTEC_LAYERS;
    { class }     property CHARACTER_SET: JEncodeHintType read _GetCHARACTER_SET;
    { class }     property CODE128_COMPACT: JEncodeHintType read _GetCODE128_COMPACT;
    { class }     property DATA_MATRIX_COMPACT: JEncodeHintType read _GetDATA_MATRIX_COMPACT;
    { class }     property DATA_MATRIX_SHAPE: JEncodeHintType read _GetDATA_MATRIX_SHAPE;
    { class }     property ERROR_CORRECTION: JEncodeHintType read _GetERROR_CORRECTION;
    { class }     property FORCE_C40: JEncodeHintType read _GetFORCE_C40;
    { class }     property FORCE_CODE_SET: JEncodeHintType read _GetFORCE_CODE_SET;
    { class }     property GS1_FORMAT: JEncodeHintType read _GetGS1_FORMAT;
    { class }     property MARGIN: JEncodeHintType read _GetMARGIN;
    { class }     property MAX_SIZE: JEncodeHintType read _GetMAX_SIZE;
    { class }     property MIN_SIZE: JEncodeHintType read _GetMIN_SIZE;
    { class }     property PDF417_AUTO_ECI: JEncodeHintType read _GetPDF417_AUTO_ECI;
    { class }     property PDF417_COMPACT: JEncodeHintType read _GetPDF417_COMPACT;
    { class }     property PDF417_COMPACTION: JEncodeHintType read _GetPDF417_COMPACTION;
    { class }     property PDF417_DIMENSIONS: JEncodeHintType read _GetPDF417_DIMENSIONS;
    { class }     property QR_COMPACT: JEncodeHintType read _GetQR_COMPACT;
    { class }     property QR_MASK_PATTERN: JEncodeHintType read _GetQR_MASK_PATTERN;
    { class }     property QR_VERSION: JEncodeHintType read _GetQR_VERSION;
  end;

  [JavaSignature('com/google/zxing/EncodeHintType')]
  JEncodeHintType = interface(JEnum)
    ['{C8DB85D1-69A9-4E43-975D-C4BAE035D1C8}']
  end;

  TJEncodeHintType = class(TJavaGenericImport<JEncodeHintTypeClass, JEncodeHintType>)
  end;

  Jzxing_FormatExceptionClass = interface(JReaderExceptionClass)
    ['{F695E70A-3442-4077-A262-4E045B35F091}']
    { class }
    function getFormatInstance: Jzxing_FormatException; cdecl; overload;
    { class }     function getFormatInstance(throwable: JThrowable): Jzxing_FormatException; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/FormatException')]
  Jzxing_FormatException = interface(JReaderException)
    ['{DE67CEDE-ACCF-4668-9D5C-41B55F0ED5B1}']
  end;

  TJzxing_FormatException = class(TJavaGenericImport<Jzxing_FormatExceptionClass, Jzxing_FormatException>)
  end;

  JLuminanceSourceClass = interface(JObjectClass)
    ['{43AF7EA8-DB0F-4584-8E8F-D9471EB16CF5}']
  end;

  [JavaSignature('com/google/zxing/LuminanceSource')]
  JLuminanceSource = interface(JObject)
    ['{A46F1F36-CF5B-42DE-8C0F-84C85B17D721}']
    function crop(i: Integer; i1: Integer; i2: Integer; i3: Integer): JLuminanceSource; cdecl;
    function getHeight: Integer; cdecl;
    function getMatrix: TJavaArray<Byte>; cdecl;
    function getRow(i: Integer; b: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function getWidth: Integer; cdecl;
    function invert: JLuminanceSource; cdecl;
    function isCropSupported: Boolean; cdecl;
    function isRotateSupported: Boolean; cdecl;
    function rotateCounterClockwise: JLuminanceSource; cdecl;
    function rotateCounterClockwise45: JLuminanceSource; cdecl;
    function toString: JString; cdecl;
  end;

  TJLuminanceSource = class(TJavaGenericImport<JLuminanceSourceClass, JLuminanceSource>)
  end;

  JInvertedLuminanceSourceClass = interface(JLuminanceSourceClass)
    ['{F6BBBF53-13DA-40FA-A699-3BE9ED956727}']
    { class }
    function init(luminanceSource: JLuminanceSource): JInvertedLuminanceSource; cdecl;
  end;

  [JavaSignature('com/google/zxing/InvertedLuminanceSource')]
  JInvertedLuminanceSource = interface(JLuminanceSource)
    ['{75F368EF-6E03-4C7E-A7AC-2D01CEDE4F38}']
    function crop(i: Integer; i1: Integer; i2: Integer; i3: Integer): JLuminanceSource; cdecl;
    function getMatrix: TJavaArray<Byte>; cdecl;
    function getRow(i: Integer; b: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function invert: JLuminanceSource; cdecl;
    function isCropSupported: Boolean; cdecl;
    function isRotateSupported: Boolean; cdecl;
    function rotateCounterClockwise: JLuminanceSource; cdecl;
    function rotateCounterClockwise45: JLuminanceSource; cdecl;
  end;

  TJInvertedLuminanceSource = class(TJavaGenericImport<JInvertedLuminanceSourceClass, JInvertedLuminanceSource>)
  end;

  Jzxing_ReaderClass = interface(IJavaClass)
    ['{F43E94C8-6118-4D18-BB0D-D5C68CF74F98}']
  end;

  [JavaSignature('com/google/zxing/Reader')]
  Jzxing_Reader = interface(IJavaInstance)
    ['{4F4CD64E-47A2-45F9-9D6A-2B428F2CB1F9}']
    function decode(binaryBitmap: JBinaryBitmap): Jzxing_Result; cdecl; overload;
    function decode(binaryBitmap: JBinaryBitmap; map: JMap): Jzxing_Result; cdecl; overload;
    procedure reset; cdecl;
  end;

  TJzxing_Reader = class(TJavaGenericImport<Jzxing_ReaderClass, Jzxing_Reader>)
  end;

  JMultiFormatReaderClass = interface(Jzxing_ReaderClass)
    ['{B393A702-23DC-44B9-A1EC-4FB1E4A87F36}']
    { class }
    function init: JMultiFormatReader; cdecl;
  end;

  [JavaSignature('com/google/zxing/MultiFormatReader')]
  JMultiFormatReader = interface(Jzxing_Reader)
    ['{CDF13C5C-3207-4A74-A804-07AB8D6468DD}']
    function decode(binaryBitmap: JBinaryBitmap): Jzxing_Result; cdecl; overload;
    function decode(binaryBitmap: JBinaryBitmap; map: JMap): Jzxing_Result; cdecl; overload;
    function decodeWithState(binaryBitmap: JBinaryBitmap): Jzxing_Result; cdecl;
    procedure reset; cdecl;
    procedure setHints(map: JMap); cdecl;
  end;

  TJMultiFormatReader = class(TJavaGenericImport<JMultiFormatReaderClass, JMultiFormatReader>)
  end;

  Jzxing_WriterClass = interface(IJavaClass)
    ['{A510ACB6-8C81-4C67-84CC-AB7E1394211B}']
  end;

  [JavaSignature('com/google/zxing/Writer')]
  Jzxing_Writer = interface(IJavaInstance)
    ['{D3F41CCF-36DB-44BC-8EFB-A8628EACD675}']
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer): JBitMatrix; cdecl; overload;
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer; map: JMap): JBitMatrix; cdecl; overload;
  end;

  TJzxing_Writer = class(TJavaGenericImport<Jzxing_WriterClass, Jzxing_Writer>)
  end;

  JMultiFormatWriterClass = interface(Jzxing_WriterClass)
    ['{9CDCB22D-106D-462F-A753-069EB0D8D759}']
    { class }
    function init: JMultiFormatWriter; cdecl;
  end;

  [JavaSignature('com/google/zxing/MultiFormatWriter')]
  JMultiFormatWriter = interface(Jzxing_Writer)
    ['{B354147A-8283-4350-ACA5-2A82E98CF04E}']
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer): JBitMatrix; cdecl; overload;
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer; map: JMap): JBitMatrix; cdecl; overload;
  end;

  TJMultiFormatWriter = class(TJavaGenericImport<JMultiFormatWriterClass, JMultiFormatWriter>)
  end;

  { Rever }
  JMultiFormatWriter_1Class = interface(JObjectClass)
    ['{7851DF93-1455-4628-B202-855982F34498}']
    { class }
    function _GetSwitchMapComgooglezxingBArcodeFormat: TJavaArray<Integer>; cdecl;
    { class }     property SwitchMapComgooglezxingBArcodeFormat: TJavaArray<Integer> read _GetSwitchMapComgooglezxingBArcodeFormat;
  end;

  [JavaSignature('com/google/zxing/MultiFormatWriter$1')]
  JMultiFormatWriter_1 = interface(JObject)
    ['{C0071025-48FA-42F2-B063-A58AAFC9CF33}']
  end;

  TJMultiFormatWriter_1 = class(TJavaGenericImport<JMultiFormatWriter_1Class, JMultiFormatWriter_1>)
  end;

  JNotFoundExceptionClass = interface(JReaderExceptionClass)
    ['{E41D0302-0CF9-4AF4-9883-AEDCD684B3B3}']
    { class }
    function getNotFoundInstance: JNotFoundException; cdecl;
  end;

  [JavaSignature('com/google/zxing/NotFoundException')]
  JNotFoundException = interface(JReaderException)
    ['{20D4FE39-72F7-43AA-8BF1-A56BD74F88A2}']
  end;

  TJNotFoundException = class(TJavaGenericImport<JNotFoundExceptionClass, JNotFoundException>)
  end;

  JPlanarYUVLuminanceSourceClass = interface(JLuminanceSourceClass)
    ['{CDC67805-05C9-4725-B853-08ECA7AC99E5}']
    { class }
    function init(b: TJavaArray<Byte>; i: Integer; i1: Integer; i2: Integer; i3: Integer; i4: Integer; i5: Integer; b1: Boolean): JPlanarYUVLuminanceSource; cdecl;
  end;

  [JavaSignature('com/google/zxing/PlanarYUVLuminanceSource')]
  JPlanarYUVLuminanceSource = interface(JLuminanceSource)
    ['{95CCE30A-77B4-4AAE-AC69-6126F2406BEE}']
    function crop(i: Integer; i1: Integer; i2: Integer; i3: Integer): JLuminanceSource; cdecl;
    function getMatrix: TJavaArray<Byte>; cdecl;
    function getRow(i: Integer; b: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function getThumbnailHeight: Integer; cdecl;
    function getThumbnailWidth: Integer; cdecl;
    function isCropSupported: Boolean; cdecl;
    function renderThumbnail: TJavaArray<Integer>; cdecl;
  end;

  TJPlanarYUVLuminanceSource = class(TJavaGenericImport<JPlanarYUVLuminanceSourceClass, JPlanarYUVLuminanceSource>)
  end;

  JRGBLuminanceSourceClass = interface(JLuminanceSourceClass)
    ['{83D1E665-EBDF-4D08-B633-D6F7142A824F}']
    { class }
    function init(i: Integer; i1: Integer; i2: TJavaArray<Integer>): JRGBLuminanceSource; cdecl;
  end;

  [JavaSignature('com/google/zxing/RGBLuminanceSource')]
  JRGBLuminanceSource = interface(JLuminanceSource)
    ['{447A59CB-40D5-4650-92AE-DDD16D7B5DD1}']
    function crop(i: Integer; i1: Integer; i2: Integer; i3: Integer): JLuminanceSource; cdecl;
    function getMatrix: TJavaArray<Byte>; cdecl;
    function getRow(i: Integer; b: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function isCropSupported: Boolean; cdecl;
  end;

  TJRGBLuminanceSource = class(TJavaGenericImport<JRGBLuminanceSourceClass, JRGBLuminanceSource>)
  end;

  Jzxing_ResultClass = interface(JObjectClass)
    ['{8D0444E8-46C4-48DF-91B8-34CD92D2AA71}']
    { class }
    function init(string_: JString; b: TJavaArray<Byte>; resultPoint: TJavaObjectArray<JResultPoint>; barcodeFormat: JBarcodeFormat): Jzxing_Result; cdecl; overload;
    { class }     function init(string_: JString; b: TJavaArray<Byte>; resultPoint: TJavaObjectArray<JResultPoint>; barcodeFormat: JBarcodeFormat; l: Int64): Jzxing_Result; cdecl; overload;
    { class }     function init(string_: JString; b: TJavaArray<Byte>; i: Integer; resultPoint: TJavaObjectArray<JResultPoint>; barcodeFormat: JBarcodeFormat; l: Int64): Jzxing_Result; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/Result')]
  Jzxing_Result = interface(JObject)
    ['{8D9B0BB4-5B78-4C49-80EB-7274E0B6FF03}']
    procedure addResultPoints(resultPoint: TJavaObjectArray<JResultPoint>); cdecl;
    function getBarcodeFormat: JBarcodeFormat; cdecl;
    function getNumBits: Integer; cdecl;
    function getRawBytes: TJavaArray<Byte>; cdecl;
    function getResultMetadata: JMap; cdecl;
    function getResultPoints: TJavaObjectArray<JResultPoint>; cdecl;
    function getText: JString; cdecl;
    function getTimestamp: Int64; cdecl;
    procedure putAllMetadata(map: JMap); cdecl;
    procedure putMetadata(resultMetadataType: JResultMetadataType; object_: JObject); cdecl;
    function toString: JString; cdecl;
  end;

  TJzxing_Result = class(TJavaGenericImport<Jzxing_ResultClass, Jzxing_Result>)
  end;

  JResultMetadataTypeClass = interface(JEnumClass)
    ['{91653517-2EBF-4EF9-8D54-67EE48128659}']
    { class }
    function _GetBYTE_SEGMENTS: JResultMetadataType; cdecl;
    { class }     function _GetERASURES_CORRECTED: JResultMetadataType; cdecl;
    { class }     function _GetERRORS_CORRECTED: JResultMetadataType; cdecl;
    { class }     function _GetERROR_CORRECTION_LEVEL: JResultMetadataType; cdecl;
    { class }     function _GetISSUE_NUMBER: JResultMetadataType; cdecl;
    { class }     function _GetORIENTATION: JResultMetadataType; cdecl;
    { class }     function _GetOTHER: JResultMetadataType; cdecl;
    { class }     function _GetPDF417_EXTRA_METADATA: JResultMetadataType; cdecl;
    { class }     function _GetPOSSIBLE_COUNTRY: JResultMetadataType; cdecl;
    { class }     function _GetSTRUCTURED_APPEND_PARITY: JResultMetadataType; cdecl;
    { class }     function _GetSTRUCTURED_APPEND_SEQUENCE: JResultMetadataType; cdecl;
    { class }     function _GetSUGGESTED_PRICE: JResultMetadataType; cdecl;
    { class }     function _GetSYMBOLOGY_IDENTIFIER: JResultMetadataType; cdecl;
    { class }     function _GetUPC_EAN_EXTENSION: JResultMetadataType; cdecl;
    { class }     function valueOf(string_: JString): JResultMetadataType; cdecl;
    { class }     function values: TJavaObjectArray<JResultMetadataType>; cdecl;
    // Deprecated
    { class }     property BYTE_SEGMENTS: JResultMetadataType read _GetBYTE_SEGMENTS;
    { class }     property ERASURES_CORRECTED: JResultMetadataType read _GetERASURES_CORRECTED;
    { class }     property ERRORS_CORRECTED: JResultMetadataType read _GetERRORS_CORRECTED;
    { class }     property ERROR_CORRECTION_LEVEL: JResultMetadataType read _GetERROR_CORRECTION_LEVEL;
    { class }     property ISSUE_NUMBER: JResultMetadataType read _GetISSUE_NUMBER;
    { class }     property ORIENTATION: JResultMetadataType read _GetORIENTATION;
    { class }     property other: JResultMetadataType read _GetOTHER;
    { class }     property PDF417_EXTRA_METADATA: JResultMetadataType read _GetPDF417_EXTRA_METADATA;
    { class }     property POSSIBLE_COUNTRY: JResultMetadataType read _GetPOSSIBLE_COUNTRY;
    { class }     property STRUCTURED_APPEND_PARITY: JResultMetadataType read _GetSTRUCTURED_APPEND_PARITY;
    { class }     property STRUCTURED_APPEND_SEQUENCE: JResultMetadataType read _GetSTRUCTURED_APPEND_SEQUENCE;
    { class }     property SUGGESTED_PRICE: JResultMetadataType read _GetSUGGESTED_PRICE;
    { class }     property SYMBOLOGY_IDENTIFIER: JResultMetadataType read _GetSYMBOLOGY_IDENTIFIER;
    { class }     property UPC_EAN_EXTENSION: JResultMetadataType read _GetUPC_EAN_EXTENSION;
  end;

  [JavaSignature('com/google/zxing/ResultMetadataType')]
  JResultMetadataType = interface(JEnum)
    ['{E01BD90F-3EEA-4C1A-93D4-1518CEA38DB3}']
  end;

  TJResultMetadataType = class(TJavaGenericImport<JResultMetadataTypeClass, JResultMetadataType>)
  end;

  JResultPointClass = interface(JObjectClass)
    ['{56F6D849-4E0A-4390-A28A-27510E1C59E7}']
    { class }
    function distance(resultPoint: JResultPoint; resultPoint1: JResultPoint): Single; cdecl;
    { class }     function init(f: Single; f1: Single): JResultPoint; cdecl;
    { class }     procedure orderBestPatterns(resultPoint: TJavaObjectArray<JResultPoint>); cdecl;
  end;

  [JavaSignature('com/google/zxing/ResultPoint')]
  JResultPoint = interface(JObject)
    ['{DFF99F66-A393-496C-99E2-BE9EFEE87B2A}']
    function equals(object_: JObject): Boolean; cdecl;
    function getX: Single; cdecl;
    function getY: Single; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;

  TJResultPoint = class(TJavaGenericImport<JResultPointClass, JResultPoint>)
  end;

  JResultPointCallbackClass = interface(IJavaClass)
    ['{431486BB-6B9D-45CF-8A12-5A200A4691C9}']
  end;

  [JavaSignature('com/google/zxing/ResultPointCallback')]
  JResultPointCallback = interface(IJavaInstance)
    ['{C4296320-7A8B-4312-AD28-36AA42326B9C}']
    procedure foundPossibleResultPoint(resultPoint: JResultPoint); cdecl;
  end;

  TJResultPointCallback = class(TJavaGenericImport<JResultPointCallbackClass, JResultPointCallback>)
  end;

  JWriterExceptionClass = interface(JExceptionClass)
    ['{BEBB18FA-6893-4822-B8E6-7D51E59E42EB}']
    { class }
    function init: JWriterException; cdecl; overload;
    { class }     function init(throwable: JThrowable): JWriterException; cdecl; overload;
    { class }     function init(string_: JString): JWriterException; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/WriterException')]
  JWriterException = interface(JException)
    ['{6E5A2414-8DE3-4840-B04F-1C1C5536DA21}']
  end;

  TJWriterException = class(TJavaGenericImport<JWriterExceptionClass, JWriterException>)
  end;

  JDetectorResultClass = interface(JObjectClass)
    ['{C00D82C3-EFA1-4242-9940-11BB161161E9}']
    { class }
    function init(bitMatrix: JBitMatrix; resultPoint: TJavaObjectArray<JResultPoint>): JDetectorResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/common/DetectorResult')]
  JDetectorResult = interface(JObject)
    ['{8BF99B70-ECFD-4372-B76C-DB5A34A87B53}']
    function getBits: JBitMatrix; cdecl;
    function getPoints: TJavaObjectArray<JResultPoint>; cdecl;
  end;

  TJDetectorResult = class(TJavaGenericImport<JDetectorResultClass, JDetectorResult>)
  end;

  JAztecDetectorResultClass = interface(JDetectorResultClass)
    ['{2140EAE6-D4A1-4751-B9D4-D3E4DBAECBB7}']
    { class }
    function init(bitMatrix: JBitMatrix; resultPoint: TJavaObjectArray<JResultPoint>; b: Boolean; i: Integer; i1: Integer): JAztecDetectorResult; cdecl; overload;
    { class }     function init(bitMatrix: JBitMatrix; resultPoint: TJavaObjectArray<JResultPoint>; b: Boolean; i: Integer; i1: Integer; i2: Integer): JAztecDetectorResult; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/aztec/AztecDetectorResult')]
  JAztecDetectorResult = interface(JDetectorResult)
    ['{119852E9-4F7F-43D4-810C-4E4ED44D428C}']
    function getErrorsCorrected: Integer; cdecl;
    function getNbDatablocks: Integer; cdecl;
    function getNbLayers: Integer; cdecl;
    function isCompact: Boolean; cdecl;
  end;

  TJAztecDetectorResult = class(TJavaGenericImport<JAztecDetectorResultClass, JAztecDetectorResult>)
  end;

  JAztecReaderClass = interface(Jzxing_ReaderClass)
    ['{093A44BB-5F2A-4501-A705-7CAE414DA2D0}']
    { class }
    function init: JAztecReader; cdecl;
  end;

  [JavaSignature('com/google/zxing/aztec/AztecReader')]
  JAztecReader = interface(Jzxing_Reader)
    ['{D65D7D8A-113B-4316-93AE-CE7CDD8691E0}']
    function decode(binaryBitmap: JBinaryBitmap): Jzxing_Result; cdecl; overload;
    function decode(binaryBitmap: JBinaryBitmap; map: JMap): Jzxing_Result; cdecl; overload;
    procedure reset; cdecl;
  end;

  TJAztecReader = class(TJavaGenericImport<JAztecReaderClass, JAztecReader>)
  end;

  JAztecWriterClass = interface(Jzxing_WriterClass)
    ['{6D2269CC-280F-4D0B-A379-4277A2BFE91F}']
    { class }
    function init: JAztecWriter; cdecl;
  end;

  [JavaSignature('com/google/zxing/aztec/AztecWriter')]
  JAztecWriter = interface(Jzxing_Writer)
    ['{56C94866-CD61-4523-A77A-0C2A0DEC30B5}']
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer): JBitMatrix; cdecl; overload;
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer; map: JMap): JBitMatrix; cdecl; overload;
  end;

  TJAztecWriter = class(TJavaGenericImport<JAztecWriterClass, JAztecWriter>)
  end;

  Jdecoder_DecoderClass = interface(JObjectClass)
    ['{0A67DE1B-3F00-4519-AF9D-B00E3483DB25}']
    { class }
    function highLevelDecode(b: TJavaArray<Boolean>): JString; cdecl;
    { class }     function init: Jdecoder_Decoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/aztec/decoder/Decoder')]
  Jdecoder_Decoder = interface(JObject)
    ['{1961E95C-7746-47A6-84FE-5386B21E6D9F}']
    function decode(aztecDetectorResult: JAztecDetectorResult): JDecoderResult; cdecl;
  end;

  TJdecoder_Decoder = class(TJavaGenericImport<Jdecoder_DecoderClass, Jdecoder_Decoder>)
  end;

  { Rever }
  JDecoder_1Class = interface(JObjectClass)
    ['{C530494D-7880-4A2B-A69E-3F59665943AF}']
    { class }
    function _GetSwitchMapComgooglezxingAztecDECoderDECoderTable: TJavaArray<Integer>; cdecl;
    { class }     property SwitchMapComgooglezxingAztecDECoderDECoderTable: TJavaArray<Integer> read _GetSwitchMapComgooglezxingAztecDECoderDECoderTable;
  end;

  [JavaSignature('com/google/zxing/aztec/decoder/Decoder$1')]
  JDecoder_1 = interface(JObject)
    ['{16579967-034A-40EC-BE88-644043C833E9}']
  end;

  TJDecoder_1 = class(TJavaGenericImport<JDecoder_1Class, JDecoder_1>)
  end;

  JDecoder_CorrectedBitsResultClass = interface(JObjectClass)
    ['{690B02B6-548F-4392-AE88-26335A3A48F3}']
    { class }
    function init(b: TJavaArray<Boolean>; i: Integer; i1: Integer): JDecoder_CorrectedBitsResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/aztec/decoder/Decoder$CorrectedBitsResult')]
  JDecoder_CorrectedBitsResult = interface(JObject)
    ['{01721D33-3A79-4167-A7F7-7C1A01501FA3}']
  end;

  TJDecoder_CorrectedBitsResult = class(TJavaGenericImport<JDecoder_CorrectedBitsResultClass, JDecoder_CorrectedBitsResult>)
  end;

  JDecoder_TableClass = interface(JEnumClass)
    ['{1899360B-2103-4CF6-89D6-64691B870BDB}']
    { class }
    function _GetBINARY: JDecoder_Table; cdecl;
    { class }     function _GetDIGIT: JDecoder_Table; cdecl;
    { class }     function _GetLOWER: JDecoder_Table; cdecl;
    { class }     function _GetMIXED: JDecoder_Table; cdecl;
    { class }     function _GetPUNCT: JDecoder_Table; cdecl;
    { class }     function _GetUPPER: JDecoder_Table; cdecl;
    { class }     function valueOf(string_: JString): JDecoder_Table; cdecl;
    { class }     function values: TJavaObjectArray<JDecoder_Table>; cdecl;
    // Deprecated
    { class }     property BINARY: JDecoder_Table read _GetBINARY;
    { class }     property DIGIT: JDecoder_Table read _GetDIGIT;
    { class }     property LOWER: JDecoder_Table read _GetLOWER;
    { class }     property MIXED: JDecoder_Table read _GetMIXED;
    { class }     property PUNCT: JDecoder_Table read _GetPUNCT;
    { class }     property UPPER: JDecoder_Table read _GetUPPER;
  end;

  [JavaSignature('com/google/zxing/aztec/decoder/Decoder$Table')]
  JDecoder_Table = interface(JEnum)
    ['{18F5031A-58BB-45EA-A0F3-E6670AB9CD03}']
  end;

  TJDecoder_Table = class(TJavaGenericImport<JDecoder_TableClass, JDecoder_Table>)
  end;

  JDetectorClass = interface(JObjectClass)
    ['{ADD51C78-2BFF-4690-A64D-08BC4813BB1A}']
    { class }
    function init(bitMatrix: JBitMatrix): JDetector; cdecl;
  end;

  [JavaSignature('com/google/zxing/aztec/detector/Detector')]
  JDetector = interface(JObject)
    ['{C0F5FE86-E016-4651-8E66-F7C7C417A6A2}']
    function detect: JAztecDetectorResult; cdecl; overload;
    function detect(b: Boolean): JAztecDetectorResult; cdecl; overload;
  end;

  TJDetector = class(TJavaGenericImport<JDetectorClass, JDetector>)
  end;

  JDetector_CorrectedParameterClass = interface(JObjectClass)
    ['{30BC4B86-54A9-4834-912F-AD364849670C}']
    { class }
    function init(i: Integer; i1: Integer): JDetector_CorrectedParameter; cdecl;
  end;

  [JavaSignature('com/google/zxing/aztec/detector/Detector$CorrectedParameter')]
  JDetector_CorrectedParameter = interface(JObject)
    ['{366BF8BF-9396-48D8-ADAF-00062B43E991}']
    function getData: Integer; cdecl;
  end;

  TJDetector_CorrectedParameter = class(TJavaGenericImport<JDetector_CorrectedParameterClass, JDetector_CorrectedParameter>)
  end;

  JDetector_PointClass = interface(JObjectClass)
    ['{6A16BA45-7A86-4E4D-8158-5CC67FA1F865}']
    { class }
    function init(i: Integer; i1: Integer): JDetector_Point; cdecl;
  end;

  [JavaSignature('com/google/zxing/aztec/detector/Detector$Point')]
  JDetector_Point = interface(JObject)
    ['{DC885057-C84E-4AE5-A951-1A92A6172E0E}']
    function toResultPoint: JResultPoint; cdecl;
    function toString: JString; cdecl;
  end;

  TJDetector_Point = class(TJavaGenericImport<JDetector_PointClass, JDetector_Point>)
  end;

  JAztecCodeClass = interface(JObjectClass)
    ['{BEC53EBF-DC89-43B1-9035-32F3B371B961}']
    { class }
    function init: JAztecCode; cdecl;
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/AztecCode')]
  JAztecCode = interface(JObject)
    ['{F0F8F147-9C6D-4CA2-9CB3-38C2BAD6ECD6}']
    function getCodeWords: Integer; cdecl;
    function getLayers: Integer; cdecl;
    function getMatrix: JBitMatrix; cdecl;
    function getSize: Integer; cdecl;
    function isCompact: Boolean; cdecl;
    procedure setCodeWords(i: Integer); cdecl;
    procedure setCompact(b: Boolean); cdecl;
    procedure setLayers(i: Integer); cdecl;
    procedure setMatrix(bitMatrix: JBitMatrix); cdecl;
    procedure setSize(i: Integer); cdecl;
  end;

  TJAztecCode = class(TJavaGenericImport<JAztecCodeClass, JAztecCode>)
  end;

  JTokenClass = interface(JObjectClass)
    ['{99C1871B-232E-4031-9CB9-CAADB080E4A9}']
    { class }
    function init(token: JToken): JToken; cdecl;
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/Token')]
  JToken = interface(JObject)
    ['{775324BE-5C8D-467C-89F1-617FBA2C9F8D}']
    function getPrevious: JToken; cdecl;
  end;

  TJToken = class(TJavaGenericImport<JTokenClass, JToken>)
  end;

  JBinaryShiftTokenClass = interface(JTokenClass)
    ['{EF02A593-A405-43FE-9955-AECF200A0404}']
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/BinaryShiftToken')]
  JBinaryShiftToken = interface(JToken)
    ['{FF2D8A39-1BE2-4F6D-8CF7-1726ED4A1053}']
    procedure appendTo(bitArray: JBitArray; b: TJavaArray<Byte>); cdecl;
    function toString: JString; cdecl;
  end;

  TJBinaryShiftToken = class(TJavaGenericImport<JBinaryShiftTokenClass, JBinaryShiftToken>)
  end;

  Jencoder_EncoderClass = interface(JObjectClass)
    ['{FEFEA247-5BB9-4B19-9042-F411ACF8ACBB}']
    { class }
    function _GetDEFAULT_AZTEC_LAYERS: Integer; cdecl;
    { class }     function _GetDEFAULT_EC_PERCENT: Integer; cdecl;
    { class }     function encode(b: TJavaArray<Byte>): JAztecCode; cdecl; overload;
    { class }     function encode(string_: JString): JAztecCode; cdecl; overload;
    // Deprecated
    { class }     function encode(b: TJavaArray<Byte>; i: Integer; i1: Integer): JAztecCode; cdecl; overload;
    { class }     function encode(string_: JString; i: Integer; i1: Integer): JAztecCode; cdecl; overload;
    { class }     function encode(b: TJavaArray<Byte>; i: Integer; i1: Integer; charset: JCharset): JAztecCode; cdecl; overload;
    { class }     function encode(string_: JString; i: Integer; i1: Integer; charset: JCharset): JAztecCode; cdecl; overload;
    { class }     property DEFAULT_AZTEC_LAYERS: Integer read _GetDEFAULT_AZTEC_LAYERS;
    { class }     property DEFAULT_EC_PERCENT: Integer read _GetDEFAULT_EC_PERCENT;
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/Encoder')]
  Jencoder_Encoder = interface(JObject)
    ['{A0B8E3C9-129A-4B23-86BF-6ED60F4E9212}']
  end;

  TJencoder_Encoder = class(TJavaGenericImport<Jencoder_EncoderClass, Jencoder_Encoder>)
  end;

  JHighLevelEncoderClass = interface(JObjectClass)
    ['{E4DE28A6-CDE4-415E-8B5A-07D0FD782ACD}']
    { class }
    function _GetLATCH_TABLE: TJavaBiArray<Integer>; cdecl;
    { class }     function _GetMODE_DIGIT: Integer; cdecl;
    { class }     function _GetMODE_LOWER: Integer; cdecl;
    { class }     function _GetMODE_MIXED: Integer; cdecl;
    { class }     function _GetMODE_PUNCT: Integer; cdecl;
    { class }     function _GetMODE_UPPER: Integer; cdecl;
    { class }     function _GetSHIFT_TABLE: TJavaBiArray<Integer>; cdecl;
    { class }     function init(b: TJavaArray<Byte>): JHighLevelEncoder; cdecl; overload; // Deprecated
    { class }
    function init(b: TJavaArray<Byte>; charset: JCharset): JHighLevelEncoder; cdecl; overload;
    { class }     property LATCH_TABLE: TJavaBiArray<Integer> read _GetLATCH_TABLE;
    { class }     property MODE_DIGIT: Integer read _GetMODE_DIGIT;
    { class }     property MODE_LOWER: Integer read _GetMODE_LOWER;
    { class }     property MODE_MIXED: Integer read _GetMODE_MIXED;
    { class }     property MODE_PUNCT: Integer read _GetMODE_PUNCT;
    { class }     property MODE_UPPER: Integer read _GetMODE_UPPER;
    { class }     property SHIFT_TABLE: TJavaBiArray<Integer> read _GetSHIFT_TABLE;
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/HighLevelEncoder')]
  JHighLevelEncoder = interface(JObject)
    ['{A6778242-9699-42C2-81D6-E245D384B07A}']
    function encode: JBitArray; cdecl;
  end;

  TJHighLevelEncoder = class(TJavaGenericImport<JHighLevelEncoderClass, JHighLevelEncoder>)
  end;

  JHighLevelEncoder_1Class = interface(JComparatorClass)
    ['{3EC87631-9E0E-4169-ABFB-B97A4CBFFA2A}']
    { class }
    function init(highLevelEncoder: JHighLevelEncoder): JHighLevelEncoder_1; cdecl;
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/HighLevelEncoder$1')]
  JHighLevelEncoder_1 = interface(JComparator)
    ['{C796E8E5-72E9-4AE4-87B2-F6F5570EB984}']
    function compare(object_: JObject; object_1: JObject): Integer; cdecl; overload;
    function compare(state: JState; state1: JState): Integer; cdecl; overload;
  end;

  TJHighLevelEncoder_1 = class(TJavaGenericImport<JHighLevelEncoder_1Class, JHighLevelEncoder_1>)
  end;

  JSimpleTokenClass = interface(JTokenClass)
    ['{00DB1DA2-40D5-400D-9031-8B9D3CDDC595}']
    { class }
    function init(token: JToken; i: Integer; i1: Integer): JSimpleToken; cdecl;
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/SimpleToken')]
  JSimpleToken = interface(JToken)
    ['{0E6238EE-A40D-40F8-9DD5-E423BB442D6D}']
    procedure appendTo(bitArray: JBitArray; b: TJavaArray<Byte>); cdecl;
    function toString: JString; cdecl;
  end;

  TJSimpleToken = class(TJavaGenericImport<JSimpleTokenClass, JSimpleToken>)
  end;

  JStateClass = interface(JObjectClass)
    ['{8183329A-166A-4B0A-9CCB-E7C139F1414F}']
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/State')]
  JState = interface(JObject)
    ['{250DA96D-97BC-44DB-8863-E3C3E8950CE5}']
    function getMode: Integer; cdecl;
    function getToken: JToken; cdecl;
    function isBetterThanOrEqualTo(state: JState): Boolean; cdecl;
    function latchAndAppend(i: Integer; i1: Integer): JState; cdecl;
    function toString: JString; cdecl;
  end;

  TJState = class(TJavaGenericImport<JStateClass, JState>)
  end;

  JResultParserClass = interface(JObjectClass)
    ['{F48AD60E-74DD-4F67-939D-02E0BB634C90}']
    { class }
    function init: JResultParser; cdecl;
    { class }     function isStringOfDigits(charSequence: JCharSequence; i: Integer): Boolean; cdecl;
    { class }     function matchPrefixedField(string_: JString; string_1: JString; c: Char; b: Boolean): TJavaObjectArray<JString>; cdecl;
    { class }     procedure maybeAppend(string_: TJavaObjectArray<JString>; stringBuilder: JStringBuilder); cdecl; overload;
    { class }     function parseResult(result: Jzxing_Result): JParsedResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/ResultParser')]
  JResultParser = interface(JObject)
    ['{4589D7BC-E953-4F2D-BAF8-92BD3DD191C4}']
    function parse(result: Jzxing_Result): JParsedResult; cdecl;
  end;

  TJResultParser = class(TJavaGenericImport<JResultParserClass, JResultParser>)
  end;

  JAbstractDoCoMoResultParserClass = interface(JResultParserClass)
    ['{65C379D0-B701-4C08-B1B8-5AD73A766326}']
    { class }
    function matchDoCoMoPrefixedField(string_: JString; string_1: JString): TJavaObjectArray<JString>; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/AbstractDoCoMoResultParser')]
  JAbstractDoCoMoResultParser = interface(JResultParser)
    ['{4ED92592-CC55-4A15-811E-B159BA0FF684}']
  end;

  TJAbstractDoCoMoResultParser = class(TJavaGenericImport<JAbstractDoCoMoResultParserClass, JAbstractDoCoMoResultParser>)
  end;

  JAddressBookAUResultParserClass = interface(JResultParserClass)
    ['{404429D1-5894-4889-B7AA-0C4F39C45520}']
    { class }
    function init: JAddressBookAUResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/AddressBookAUResultParser')]
  JAddressBookAUResultParser = interface(JResultParser)
    ['{F833B189-8C72-4DED-93B2-448037774A9D}']
    function parse(result: Jzxing_Result): JAddressBookParsedResult; cdecl;
  end;

  TJAddressBookAUResultParser = class(TJavaGenericImport<JAddressBookAUResultParserClass, JAddressBookAUResultParser>)
  end;

  JAddressBookDoCoMoResultParserClass = interface(JAbstractDoCoMoResultParserClass)
    ['{DEC1DAA3-2976-4EA0-9758-51AD5F5D0A8C}']
    { class }
    function init: JAddressBookDoCoMoResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/AddressBookDoCoMoResultParser')]
  JAddressBookDoCoMoResultParser = interface(JAbstractDoCoMoResultParser)
    ['{CB0DA677-1D48-4CAC-9216-4FB54A4283BF}']
    function parse(result: Jzxing_Result): JAddressBookParsedResult; cdecl;
  end;

  TJAddressBookDoCoMoResultParser = class(TJavaGenericImport<JAddressBookDoCoMoResultParserClass, JAddressBookDoCoMoResultParser>)
  end;

  JParsedResultClass = interface(JObjectClass)
    ['{4E3AB49F-C0AC-48BB-B1E4-83DB7CB1D3C3}']
    { class }
    procedure maybeAppend(string_: TJavaObjectArray<JString>; stringBuilder: JStringBuilder); cdecl; overload;
    { class }     procedure maybeAppend(string_: JString; stringBuilder: JStringBuilder); cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/client/result/ParsedResult')]
  JParsedResult = interface(JObject)
    ['{3898C600-44CF-4A14-B593-C9340AC1D6BC}']
    function getDisplayResult: JString; cdecl;
    function getType: JParsedResultType; cdecl;
    function toString: JString; cdecl;
  end;

  TJParsedResult = class(TJavaGenericImport<JParsedResultClass, JParsedResult>)
  end;

  JAddressBookParsedResultClass = interface(JParsedResultClass)
    ['{B1A453F5-ABBA-470C-8522-ECD73EA13B40}']
    { class }
    function init(string_: TJavaObjectArray<JString>; string_1: TJavaObjectArray<JString>; string_2: TJavaObjectArray<JString>; string_3: TJavaObjectArray<JString>; string_4: TJavaObjectArray<JString>; string_5: TJavaObjectArray<JString>; string_6: TJavaObjectArray<JString>): JAddressBookParsedResult; cdecl; overload;
    { class }     function init(string_: TJavaObjectArray<JString>; string_1: TJavaObjectArray<JString>; string_2: JString; string_3: TJavaObjectArray<JString>; string_4: TJavaObjectArray<JString>; string_5: TJavaObjectArray<JString>; string_6: TJavaObjectArray<JString>; string_7: JString; string_8: JString; string_9: TJavaObjectArray<JString>; string_10: TJavaObjectArray<JString>; string_11: JString; string_12: JString; string_13: JString; string_14: TJavaObjectArray<JString>; string_15: TJavaObjectArray<JString>): JAddressBookParsedResult; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/client/result/AddressBookParsedResult')]
  JAddressBookParsedResult = interface(JParsedResult)
    ['{B84291E2-392E-4F55-B5B8-627647923E0C}']
    function getAddressTypes: TJavaObjectArray<JString>; cdecl;
    function getAddresses: TJavaObjectArray<JString>; cdecl;
    function getBirthday: JString; cdecl;
    function getDisplayResult: JString; cdecl;
    function getEmailTypes: TJavaObjectArray<JString>; cdecl;
    function getEmails: TJavaObjectArray<JString>; cdecl;
    function getGeo: TJavaObjectArray<JString>; cdecl;
    function getInstantMessenger: JString; cdecl;
    function getNames: TJavaObjectArray<JString>; cdecl;
    function getNicknames: TJavaObjectArray<JString>; cdecl;
    function getNote: JString; cdecl;
    function getOrg: JString; cdecl;
    function getPhoneNumbers: TJavaObjectArray<JString>; cdecl;
    function getPhoneTypes: TJavaObjectArray<JString>; cdecl;
    function getPronunciation: JString; cdecl;
    function getTitle: JString; cdecl;
    function getURLs: TJavaObjectArray<JString>; cdecl;
  end;

  TJAddressBookParsedResult = class(TJavaGenericImport<JAddressBookParsedResultClass, JAddressBookParsedResult>)
  end;

  JBizcardResultParserClass = interface(JAbstractDoCoMoResultParserClass)
    ['{9E1B00A5-8C5D-4D49-88AA-4889F1DC6108}']
    { class }
    function init: JBizcardResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/BizcardResultParser')]
  JBizcardResultParser = interface(JAbstractDoCoMoResultParser)
    ['{5422F7A6-541D-44CD-A949-F418695ABC02}']
    function parse(result: Jzxing_Result): JAddressBookParsedResult; cdecl;
  end;

  TJBizcardResultParser = class(TJavaGenericImport<JBizcardResultParserClass, JBizcardResultParser>)
  end;

  JBookmarkDoCoMoResultParserClass = interface(JAbstractDoCoMoResultParserClass)
    ['{5B126EBF-08C2-4499-A4A7-E4B8C59B0323}']
    { class }
    function init: JBookmarkDoCoMoResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/BookmarkDoCoMoResultParser')]
  JBookmarkDoCoMoResultParser = interface(JAbstractDoCoMoResultParser)
    ['{B040485F-1089-4014-808D-60C3BAAE82C6}']
    function parse(result: Jzxing_Result): JURIParsedResult; cdecl;
  end;

  TJBookmarkDoCoMoResultParser = class(TJavaGenericImport<JBookmarkDoCoMoResultParserClass, JBookmarkDoCoMoResultParser>)
  end;

  JCalendarParsedResultClass = interface(JParsedResultClass)
    ['{107D978B-2C23-4D67-97B4-E863BE59BC24}']
    { class }
    function init(string_: JString; string_1: JString; string_2: JString; string_3: JString; string_4: JString; string_5: JString; string_6: TJavaObjectArray<JString>; string_7: JString; d: Double; d1: Double): JCalendarParsedResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/CalendarParsedResult')]
  JCalendarParsedResult = interface(JParsedResult)
    ['{4DD012A6-49D8-4675-8520-300006945786}']
    function getAttendees: TJavaObjectArray<JString>; cdecl;
    function getDescription: JString; cdecl;
    function getDisplayResult: JString; cdecl;
    function getEnd: JDate; cdecl;
    function getEndTimestamp: Int64; cdecl;
    function getLatitude: Double; cdecl;
    function getLocation: JString; cdecl;
    function getLongitude: Double; cdecl;
    function getOrganizer: JString; cdecl;
    function getStart: JDate; cdecl;
    function getStartTimestamp: Int64; cdecl;
    function getSummary: JString; cdecl;
    function isEndAllDay: Boolean; cdecl;
    function isStartAllDay: Boolean; cdecl;
  end;

  TJCalendarParsedResult = class(TJavaGenericImport<JCalendarParsedResultClass, JCalendarParsedResult>)
  end;

  JEmailAddressParsedResultClass = interface(JParsedResultClass)
    ['{CCF702A3-679B-46BA-A4C1-1B669DF7BD03}']
    { class }
    function init(string_: JString): JEmailAddressParsedResult; cdecl; overload;
    { class }     function init(string_: TJavaObjectArray<JString>; string_1: TJavaObjectArray<JString>; string_2: TJavaObjectArray<JString>; string_3: JString; string_4: JString): JEmailAddressParsedResult; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/client/result/EmailAddressParsedResult')]
  JEmailAddressParsedResult = interface(JParsedResult)
    ['{CD6E4A08-CD90-4088-9828-1BF36F5EA7C7}']
    function getBCCs: TJavaObjectArray<JString>; cdecl;
    function getBody: JString; cdecl;
    function getCCs: TJavaObjectArray<JString>; cdecl;
    function getDisplayResult: JString; cdecl;
    function getEmailAddress: JString; cdecl;
    function getMailtoURI: JString; cdecl;
    function getSubject: JString; cdecl;
    function getTos: TJavaObjectArray<JString>; cdecl;
  end;

  TJEmailAddressParsedResult = class(TJavaGenericImport<JEmailAddressParsedResultClass, JEmailAddressParsedResult>)
  end;

  JEmailAddressResultParserClass = interface(JResultParserClass)
    ['{79F4C266-2D35-4A1D-95F0-12CC0658931C}']
    { class }
    function init: JEmailAddressResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/EmailAddressResultParser')]
  JEmailAddressResultParser = interface(JResultParser)
    ['{6CF694FD-7319-4C7D-B917-3A72B827C9E8}']
    function parse(result: Jzxing_Result): JEmailAddressParsedResult; cdecl;
  end;

  TJEmailAddressResultParser = class(TJavaGenericImport<JEmailAddressResultParserClass, JEmailAddressResultParser>)
  end;

  JEmailDoCoMoResultParserClass = interface(JAbstractDoCoMoResultParserClass)
    ['{C6AF0138-297D-422D-9274-D7353960C571}']
    { class }
    function init: JEmailDoCoMoResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/EmailDoCoMoResultParser')]
  JEmailDoCoMoResultParser = interface(JAbstractDoCoMoResultParser)
    ['{9E0B64B2-8B50-4D08-A9C2-23845FD2ABE8}']
    function parse(result: Jzxing_Result): JEmailAddressParsedResult; cdecl;
  end;

  TJEmailDoCoMoResultParser = class(TJavaGenericImport<JEmailDoCoMoResultParserClass, JEmailDoCoMoResultParser>)
  end;

  JExpandedProductParsedResultClass = interface(JParsedResultClass)
    ['{38160CD1-94BC-4FFC-B233-78BEA360CB7F}']
    { class }
    function _GetKILOGRAM: JString; cdecl;
    { class }     function _GetPOUND: JString; cdecl;
    { class }     function init(string_: JString; string_1: JString; string_2: JString; string_3: JString; string_4: JString; string_5: JString; string_6: JString; string_7: JString; string_8: JString; string_9: JString; string_10: JString; string_11: JString; string_12: JString; string_13: JString; map: JMap): JExpandedProductParsedResult; cdecl; // Deprecated
    { class }
    property KILOGRAM: JString read _GetKILOGRAM;
    { class }     property POUND: JString read _GetPOUND;
  end;

  [JavaSignature('com/google/zxing/client/result/ExpandedProductParsedResult')]
  JExpandedProductParsedResult = interface(JParsedResult)
    ['{AC4B8703-85EC-4AB3-AD5C-531AD55683E9}']
    function equals(object_: JObject): Boolean; cdecl;
    function getBestBeforeDate: JString; cdecl;
    function getDisplayResult: JString; cdecl;
    function getExpirationDate: JString; cdecl;
    function getLotNumber: JString; cdecl;
    function getPackagingDate: JString; cdecl;
    function getPrice: JString; cdecl;
    function getPriceCurrency: JString; cdecl;
    function getPriceIncrement: JString; cdecl;
    function getProductID: JString; cdecl;
    function getProductionDate: JString; cdecl;
    function getRawText: JString; cdecl;
    function getSscc: JString; cdecl;
    function getUncommonAIs: JMap; cdecl;
    function getWeight: JString; cdecl;
    function getWeightIncrement: JString; cdecl;
    function getWeightType: JString; cdecl;
    function hashCode: Integer; cdecl;
  end;

  TJExpandedProductParsedResult = class(TJavaGenericImport<JExpandedProductParsedResultClass, JExpandedProductParsedResult>)
  end;

  JExpandedProductResultParserClass = interface(JResultParserClass)
    ['{4827E0B5-3658-48D1-97BB-813B65814277}']
    { class }
    function init: JExpandedProductResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/ExpandedProductResultParser')]
  JExpandedProductResultParser = interface(JResultParser)
    ['{B9AA33FC-5FCC-4228-9637-B9B772AF33A1}']
    function parse(result: Jzxing_Result): JExpandedProductParsedResult; cdecl;
  end;

  TJExpandedProductResultParser = class(TJavaGenericImport<JExpandedProductResultParserClass, JExpandedProductResultParser>)
  end;

  JGeoParsedResultClass = interface(JParsedResultClass)
    ['{47F2135D-D371-42C3-8C90-2EF1274F5EBC}']
    { class }
    function init(d: Double; d1: Double; d2: Double; string_: JString): JGeoParsedResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/GeoParsedResult')]
  JGeoParsedResult = interface(JParsedResult)
    ['{D2626579-296B-4A69-896A-C4EDDE57E83F}']
    function getAltitude: Double; cdecl;
    function getDisplayResult: JString; cdecl;
    function getGeoURI: JString; cdecl;
    function getLatitude: Double; cdecl;
    function getLongitude: Double; cdecl;
    function getQuery: JString; cdecl;
  end;

  TJGeoParsedResult = class(TJavaGenericImport<JGeoParsedResultClass, JGeoParsedResult>)
  end;

  JGeoResultParserClass = interface(JResultParserClass)
    ['{82036670-5DF4-43F7-972D-6A4F5D707FB8}']
    { class }
    function init: JGeoResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/GeoResultParser')]
  JGeoResultParser = interface(JResultParser)
    ['{90AB36E0-A48B-4CB0-98E1-4D0C58EA0638}']
    function parse(result: Jzxing_Result): JGeoParsedResult; cdecl;
  end;

  TJGeoResultParser = class(TJavaGenericImport<JGeoResultParserClass, JGeoResultParser>)
  end;

  JISBNParsedResultClass = interface(JParsedResultClass)
    ['{8F330CC9-EB7A-4D42-B172-BC85E1624663}']
    { class }
    function init(string_: JString): JISBNParsedResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/ISBNParsedResult')]
  JISBNParsedResult = interface(JParsedResult)
    ['{3F451F07-A2EE-4CC5-A477-AC763B3C0CD7}']
    function getDisplayResult: JString; cdecl;
    function getISBN: JString; cdecl;
  end;

  TJISBNParsedResult = class(TJavaGenericImport<JISBNParsedResultClass, JISBNParsedResult>)
  end;

  JISBNResultParserClass = interface(JResultParserClass)
    ['{D4B27757-08F9-4AEF-8E23-E79763841F71}']
    { class }
    function init: JISBNResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/ISBNResultParser')]
  JISBNResultParser = interface(JResultParser)
    ['{94DC65F1-D535-4608-94FE-252EF9CBEE37}']
    function parse(result: Jzxing_Result): JISBNParsedResult; cdecl;
  end;

  TJISBNResultParser = class(TJavaGenericImport<JISBNResultParserClass, JISBNResultParser>)
  end;

  JParsedResultTypeClass = interface(JEnumClass)
    ['{BEC22095-1BF7-417E-B38E-DB2A5FB36973}']
    { class }
    function _GetADDRESSBOOK: JParsedResultType; cdecl;
    { class }     function _GetCALENDAR: JParsedResultType; cdecl;
    { class }     function _GetEMAIL_ADDRESS: JParsedResultType; cdecl;
    { class }     function _GetGEO: JParsedResultType; cdecl;
    { class }     function _GetISBN: JParsedResultType; cdecl;
    { class }     function _GetPRODUCT: JParsedResultType; cdecl;
    { class }     function _GetSMS: JParsedResultType; cdecl;
    { class }     function _GetTEL: JParsedResultType; cdecl;
    { class }     function _GetTEXT: JParsedResultType; cdecl;
    { class }     function _GetURI: JParsedResultType; cdecl;
    { class }     function _GetVIN: JParsedResultType; cdecl;
    { class }     function _GetWIFI: JParsedResultType; cdecl;
    { class }     function valueOf(string_: JString): JParsedResultType; cdecl;
    { class }     function values: TJavaObjectArray<JParsedResultType>; cdecl;
    // Deprecated
    { class }     property ADDRESSBOOK: JParsedResultType read _GetADDRESSBOOK;
    { class }     property CALENDAR: JParsedResultType read _GetCALENDAR;
    { class }     property EMAIL_ADDRESS: JParsedResultType read _GetEMAIL_ADDRESS;
    { class }     property GEO: JParsedResultType read _GetGEO;
    { class }     property ISBN: JParsedResultType read _GetISBN;
    { class }     property PRODUCT: JParsedResultType read _GetPRODUCT;
    { class }     property SMS: JParsedResultType read _GetSMS;
    { class }     property TEL: JParsedResultType read _GetTEL;
    { class }     property TEXT: JParsedResultType read _GetTEXT;
    { class }     property URI: JParsedResultType read _GetURI;
    { class }     property VIN: JParsedResultType read _GetVIN;
    { class }     property WIFI: JParsedResultType read _GetWIFI;
  end;

  [JavaSignature('com/google/zxing/client/result/ParsedResultType')]
  JParsedResultType = interface(JEnum)
    ['{1AE76654-8FA7-4E65-978D-5CD95E7FB554}']
  end;

  TJParsedResultType = class(TJavaGenericImport<JParsedResultTypeClass, JParsedResultType>)
  end;

  JProductParsedResultClass = interface(JParsedResultClass)
    ['{88B0CF89-29AB-45A4-9F0F-5D4A872D6F54}']
    { class }
    function init(string_: JString): JProductParsedResult; cdecl; overload;
    { class }     function init(string_: JString; string_1: JString): JProductParsedResult; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/client/result/ProductParsedResult')]
  JProductParsedResult = interface(JParsedResult)
    ['{37B88A0D-DF4B-402D-A034-6053F7DDDE15}']
    function getDisplayResult: JString; cdecl;
    function getNormalizedProductID: JString; cdecl;
    function getProductID: JString; cdecl;
  end;

  TJProductParsedResult = class(TJavaGenericImport<JProductParsedResultClass, JProductParsedResult>)
  end;

  JProductResultParserClass = interface(JResultParserClass)
    ['{647B5DA4-35A9-4CD7-949C-2B07B29F5198}']
    { class }
    function init: JProductResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/ProductResultParser')]
  JProductResultParser = interface(JResultParser)
    ['{CF03168E-1D82-44D2-B37B-B2512714E0E4}']
    function parse(result: Jzxing_Result): JProductParsedResult; cdecl;
  end;

  TJProductResultParser = class(TJavaGenericImport<JProductResultParserClass, JProductResultParser>)
  end;

  JSMSMMSResultParserClass = interface(JResultParserClass)
    ['{297A6600-8B5D-4CF7-9A54-30170358039C}']
    { class }
    function init: JSMSMMSResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/SMSMMSResultParser')]
  JSMSMMSResultParser = interface(JResultParser)
    ['{028C2104-88F6-40CE-8CEB-641DA4765FDF}']
    function parse(result: Jzxing_Result): JSMSParsedResult; cdecl;
  end;

  TJSMSMMSResultParser = class(TJavaGenericImport<JSMSMMSResultParserClass, JSMSMMSResultParser>)
  end;

  JSMSParsedResultClass = interface(JParsedResultClass)
    ['{F52DF604-F7AC-4629-A50C-F4AACA4725B5}']
    { class }
    function init(string_: JString; string_1: JString; string_2: JString; string_3: JString): JSMSParsedResult; cdecl; overload;
    { class }     function init(string_: TJavaObjectArray<JString>; string_1: TJavaObjectArray<JString>; string_2: JString; string_3: JString): JSMSParsedResult; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/client/result/SMSParsedResult')]
  JSMSParsedResult = interface(JParsedResult)
    ['{73F0C95B-3FE8-4E10-A9FF-5EAF95B30279}']
    function getBody: JString; cdecl;
    function getDisplayResult: JString; cdecl;
    function getNumbers: TJavaObjectArray<JString>; cdecl;
    function getSMSURI: JString; cdecl;
    function getSubject: JString; cdecl;
    function getVias: TJavaObjectArray<JString>; cdecl;
  end;

  TJSMSParsedResult = class(TJavaGenericImport<JSMSParsedResultClass, JSMSParsedResult>)
  end;

  JSMSTOMMSTOResultParserClass = interface(JResultParserClass)
    ['{13F109CA-99D5-4A01-9EC5-A36971BBECB8}']
    { class }
    function init: JSMSTOMMSTOResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/SMSTOMMSTOResultParser')]
  JSMSTOMMSTOResultParser = interface(JResultParser)
    ['{8C6F1297-42A7-4F3A-87F2-C8DAC3B3EAB1}']
    function parse(result: Jzxing_Result): JSMSParsedResult; cdecl;
  end;

  TJSMSTOMMSTOResultParser = class(TJavaGenericImport<JSMSTOMMSTOResultParserClass, JSMSTOMMSTOResultParser>)
  end;

  JSMTPResultParserClass = interface(JResultParserClass)
    ['{8077A0E1-2144-4F29-8AEA-99510EB743B8}']
    { class }
    function init: JSMTPResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/SMTPResultParser')]
  JSMTPResultParser = interface(JResultParser)
    ['{A34B5F50-DEFD-424E-8A51-20E4FFEA0002}']
    function parse(result: Jzxing_Result): JEmailAddressParsedResult; cdecl;
  end;

  TJSMTPResultParser = class(TJavaGenericImport<JSMTPResultParserClass, JSMTPResultParser>)
  end;

  JTelParsedResultClass = interface(JParsedResultClass)
    ['{31183CA2-2772-488A-B659-8F835E7E7216}']
    { class }
    function init(string_: JString; string_1: JString; string_2: JString): JTelParsedResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/TelParsedResult')]
  JTelParsedResult = interface(JParsedResult)
    ['{F44539B4-3AA2-4FC0-BDD9-057435050FAE}']
    function getDisplayResult: JString; cdecl;
    function getNumber: JString; cdecl;
    function getTelURI: JString; cdecl;
    function getTitle: JString; cdecl;
  end;

  TJTelParsedResult = class(TJavaGenericImport<JTelParsedResultClass, JTelParsedResult>)
  end;

  JTelResultParserClass = interface(JResultParserClass)
    ['{2B83E3D5-FEF8-46E7-A023-E8D7194B6C31}']
    { class }
    function init: JTelResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/TelResultParser')]
  JTelResultParser = interface(JResultParser)
    ['{4C4F29FD-1581-4186-ACA9-90A48046950A}']
    function parse(result: Jzxing_Result): JTelParsedResult; cdecl;
  end;

  TJTelResultParser = class(TJavaGenericImport<JTelResultParserClass, JTelResultParser>)
  end;

  JTextParsedResultClass = interface(JParsedResultClass)
    ['{E804F0CE-A583-4D6E-8532-75C4282E21C6}']
    { class }
    function init(string_: JString; string_1: JString): JTextParsedResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/TextParsedResult')]
  JTextParsedResult = interface(JParsedResult)
    ['{226514A9-00C0-465C-B5AF-3D6CFDC69C32}']
    function getDisplayResult: JString; cdecl;
    function getLanguage: JString; cdecl;
    function getText: JString; cdecl;
  end;

  TJTextParsedResult = class(TJavaGenericImport<JTextParsedResultClass, JTextParsedResult>)
  end;

  JURIParsedResultClass = interface(JParsedResultClass)
    ['{BC7E5712-9B6C-44D5-AC6E-F40645BC1E19}']
    { class }
    function init(string_: JString; string_1: JString): JURIParsedResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/URIParsedResult')]
  JURIParsedResult = interface(JParsedResult)
    ['{66CEB1C5-37F5-40CA-986B-A7EBB4B8D13A}']
    function getDisplayResult: JString; cdecl;
    function getTitle: JString; cdecl;
    function getURI: JString; cdecl;
    function isPossiblyMaliciousURI: Boolean; cdecl;
  end;

  TJURIParsedResult = class(TJavaGenericImport<JURIParsedResultClass, JURIParsedResult>)
  end;

  JURIResultParserClass = interface(JResultParserClass)
    ['{AEB82182-9C3F-4DE3-92BB-13B26A4BE936}']
    { class }
    function init: JURIResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/URIResultParser')]
  JURIResultParser = interface(JResultParser)
    ['{492045F4-626A-4418-9308-446B2A46578E}']
    function parse(result: Jzxing_Result): JURIParsedResult; cdecl;
  end;

  TJURIResultParser = class(TJavaGenericImport<JURIResultParserClass, JURIResultParser>)
  end;

  JURLTOResultParserClass = interface(JResultParserClass)
    ['{A35F756D-DC45-4A96-8FF6-83084E5CFC5D}']
    { class }
    function init: JURLTOResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/URLTOResultParser')]
  JURLTOResultParser = interface(JResultParser)
    ['{2F73B736-807A-474D-A6EB-7C5EEDFB8D43}']
    function parse(result: Jzxing_Result): JURIParsedResult; cdecl;
  end;

  TJURLTOResultParser = class(TJavaGenericImport<JURLTOResultParserClass, JURLTOResultParser>)
  end;

  JVCardResultParserClass = interface(JResultParserClass)
    ['{7B7B622B-348F-47B1-A583-9B2263EE6020}']
    { class }
    function init: JVCardResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/VCardResultParser')]
  JVCardResultParser = interface(JResultParser)
    ['{6629AC81-FD13-4013-821F-E36A95CB36E6}']
    function parse(result: Jzxing_Result): JAddressBookParsedResult; cdecl;
  end;

  TJVCardResultParser = class(TJavaGenericImport<JVCardResultParserClass, JVCardResultParser>)
  end;

  JVEventResultParserClass = interface(JResultParserClass)
    ['{E1B26DAC-FEAF-490E-9D3B-1D7716DF7F2E}']
    { class }
    function init: JVEventResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/VEventResultParser')]
  JVEventResultParser = interface(JResultParser)
    ['{2C6DBEE3-08C8-4BD3-8889-3794642903C6}']
    function parse(result: Jzxing_Result): JCalendarParsedResult; cdecl;
  end;

  TJVEventResultParser = class(TJavaGenericImport<JVEventResultParserClass, JVEventResultParser>)
  end;

  JVINParsedResultClass = interface(JParsedResultClass)
    ['{9BB66FA2-425D-4898-A3B9-870B9793342F}']
    { class }
    function init(string_: JString; string_1: JString; string_2: JString; string_3: JString; string_4: JString; string_5: JString; i: Integer; c: Char; string_6: JString): JVINParsedResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/VINParsedResult')]
  JVINParsedResult = interface(JParsedResult)
    ['{73534874-1F6F-43D4-8B53-70B449C00975}']
    function getCountryCode: JString; cdecl;
    function getDisplayResult: JString; cdecl;
    function getModelYear: Integer; cdecl;
    function getPlantCode: Char; cdecl;
    function getSequentialNumber: JString; cdecl;
    function getVIN: JString; cdecl;
    function getVehicleAttributes: JString; cdecl;
    function getVehicleDescriptorSection: JString; cdecl;
    function getVehicleIdentifierSection: JString; cdecl;
    function getWorldManufacturerID: JString; cdecl;
  end;

  TJVINParsedResult = class(TJavaGenericImport<JVINParsedResultClass, JVINParsedResult>)
  end;

  JVINResultParserClass = interface(JResultParserClass)
    ['{2DC32F5C-A814-471F-9284-B13F3623E7BE}']
    { class }
    function init: JVINResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/VINResultParser')]
  JVINResultParser = interface(JResultParser)
    ['{A3F89144-745B-43EB-A933-D1E2BCE3468C}']
    function parse(result: Jzxing_Result): JVINParsedResult; cdecl;
  end;

  TJVINResultParser = class(TJavaGenericImport<JVINResultParserClass, JVINResultParser>)
  end;

  JWifiParsedResultClass = interface(JParsedResultClass)
    ['{675923A3-DA32-4125-97C6-9F220DC7B496}']
    { class }
    function init(string_: JString; string_1: JString; string_2: JString): JWifiParsedResult; cdecl; overload;
    { class }     function init(string_: JString; string_1: JString; string_2: JString; b: Boolean): JWifiParsedResult; cdecl; overload;
    { class }     function init(string_: JString; string_1: JString; string_2: JString; b: Boolean; string_3: JString; string_4: JString; string_5: JString; string_6: JString): JWifiParsedResult; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/client/result/WifiParsedResult')]
  JWifiParsedResult = interface(JParsedResult)
    ['{CF694F72-65D5-4456-9161-48778FEE77C2}']
    function getAnonymousIdentity: JString; cdecl;
    function getDisplayResult: JString; cdecl;
    function getEapMethod: JString; cdecl;
    function getIdentity: JString; cdecl;
    function getNetworkEncryption: JString; cdecl;
    function getPassword: JString; cdecl;
    function getPhase2Method: JString; cdecl;
    function getSsid: JString; cdecl;
    function isHidden: Boolean; cdecl;
  end;

  TJWifiParsedResult = class(TJavaGenericImport<JWifiParsedResultClass, JWifiParsedResult>)
  end;

  JWifiResultParserClass = interface(JResultParserClass)
    ['{35F39037-F581-4ED4-AEF2-E6C6B689207B}']
    { class }
    function init: JWifiResultParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/client/result/WifiResultParser')]
  JWifiResultParser = interface(JResultParser)
    ['{D726FA85-2F35-4492-86F1-B904301C2783}']
    function parse(result: Jzxing_Result): JWifiParsedResult; cdecl;
  end;

  TJWifiResultParser = class(TJavaGenericImport<JWifiResultParserClass, JWifiResultParser>)
  end;

  JBitArrayClass = interface(JCloneableClass)
    ['{BC6DC040-0487-4AC0-975C-5C3DB24924E7}']
    { class }
    function init: JBitArray; cdecl; overload;
    { class }     function init(i: Integer): JBitArray; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/common/BitArray')]
  JBitArray = interface(JCloneable)
    ['{27401BC3-C764-4D72-A969-DA3AA6C33469}']
    procedure appendBit(b: Boolean); cdecl;
    procedure appendBitArray(bitArray: JBitArray); cdecl;
    procedure appendBits(i: Integer; i1: Integer); cdecl;
    procedure clear; cdecl;
    function clone: JBitArray; cdecl;
    function equals(object_: JObject): Boolean; cdecl;
    procedure flip(i: Integer); cdecl;
    function &get(i: Integer): Boolean; cdecl;
    function getBitArray: TJavaArray<Integer>; cdecl;
    function getNextSet(i: Integer): Integer; cdecl;
    function getNextUnset(i: Integer): Integer; cdecl;
    function getSize: Integer; cdecl;
    function getSizeInBytes: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isRange(i: Integer; i1: Integer; b: Boolean): Boolean; cdecl;
    procedure REVERSE; cdecl;
    procedure &set(i: Integer); cdecl;
    procedure setBulk(i: Integer; i1: Integer); cdecl;
    procedure setRange(i: Integer; i1: Integer); cdecl;
    procedure toBytes(i: Integer; b: TJavaArray<Byte>; i1: Integer; i2: Integer); cdecl;
    function toString: JString; cdecl;
    procedure &xor(bitArray: JBitArray); cdecl;
  end;

  TJBitArray = class(TJavaGenericImport<JBitArrayClass, JBitArray>)
  end;

  JBitMatrixClass = interface(JCloneableClass)
    ['{2F28A17A-451D-4ECA-B3B8-EBCC064BC731}']
    { class }
    function init(i: Integer): JBitMatrix; cdecl; overload;
    { class }     function init(i: Integer; i1: Integer): JBitMatrix; cdecl; overload;
    { class }     function parse(b: TJavaBiArray<Boolean>): JBitMatrix; cdecl; overload;
    { class }     function parse(string_: JString; string_1: JString; string_2: JString): JBitMatrix; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/common/BitMatrix')]
  JBitMatrix = interface(JCloneable)
    ['{BBDB6324-D754-4EC2-A2D6-B453E9733672}']
    procedure clear; cdecl;
    function clone: JBitMatrix; cdecl;
    function equals(object_: JObject): Boolean; cdecl;
    procedure flip; cdecl; overload;
    procedure flip(i: Integer; i1: Integer); cdecl; overload;
    function &get(i: Integer; i1: Integer): Boolean; cdecl;
    function getBottomRightOnBit: TJavaArray<Integer>; cdecl;
    function getEnclosingRectangle: TJavaArray<Integer>; cdecl;
    function getHeight: Integer; cdecl;
    function getRow(i: Integer; bitArray: JBitArray): JBitArray; cdecl;
    function getRowSize: Integer; cdecl;
    function getTopLeftOnBit: TJavaArray<Integer>; cdecl;
    function getWidth: Integer; cdecl;
    function hashCode: Integer; cdecl;
    procedure rotate(i: Integer); cdecl;
    procedure rotate180; cdecl;
    procedure rotate90; cdecl;
    procedure &set(i: Integer; i1: Integer); cdecl;
    procedure setRegion(i: Integer; i1: Integer; i2: Integer; i3: Integer); cdecl;
    procedure setRow(i: Integer; bitArray: JBitArray); cdecl;
    function toString: JString; cdecl; overload;
    function toString(string_: JString; string_1: JString): JString; cdecl; overload;
    function toString(string_: JString; string_1: JString; string_2: JString): JString; cdecl; overload;
    procedure unset(i: Integer; i1: Integer); cdecl;
    procedure &xor(bitMatrix: JBitMatrix); cdecl;
  end;

  TJBitMatrix = class(TJavaGenericImport<JBitMatrixClass, JBitMatrix>)
  end;

  JBitSourceClass = interface(JObjectClass)
    ['{10D458E7-4037-4E10-A139-552E77B978D5}']
    { class }
    function init(b: TJavaArray<Byte>): JBitSource; cdecl;
  end;

  [JavaSignature('com/google/zxing/common/BitSource')]
  JBitSource = interface(JObject)
    ['{D563531F-C36C-4CF4-AE26-650985E8B085}']
    function available: Integer; cdecl;
    function getBitOffset: Integer; cdecl;
    function getByteOffset: Integer; cdecl;
    function readBits(i: Integer): Integer; cdecl;
  end;

  TJBitSource = class(TJavaGenericImport<JBitSourceClass, JBitSource>)
  end;

  JCharacterSetECIClass = interface(JEnumClass)
    ['{A947AE72-5C35-44C2-8353-517A86876C9F}']
    { class }
    function _GetASCII: JCharacterSetECI; cdecl;
    { class }     function _GetBig5: JCharacterSetECI; cdecl;
    { class }     function _GetCp1250: JCharacterSetECI; cdecl;
    { class }     function _GetCp1251: JCharacterSetECI; cdecl;
    { class }     function _GetCp1252: JCharacterSetECI; cdecl;
    { class }     function _GetCp1256: JCharacterSetECI; cdecl;
    { class }     function _GetCp437: JCharacterSetECI; cdecl;
    { class }     function _GetEUC_KR: JCharacterSetECI; cdecl;
    { class }     function _GetGB18030: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_1: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_10: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_11: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_13: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_14: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_15: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_16: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_2: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_3: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_4: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_5: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_6: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_7: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_8: JCharacterSetECI; cdecl;
    { class }     function _GetISO8859_9: JCharacterSetECI; cdecl;
    { class }     function _GetSJIS: JCharacterSetECI; cdecl;
    { class }     function _GetUTF8: JCharacterSetECI; cdecl;
    { class }     function _GetUnicodeBigUnmarked: JCharacterSetECI; cdecl;
    { class }     function getCharacterSetECI(charset: JCharset): JCharacterSetECI; cdecl;
    { class }     function getCharacterSetECIByName(string_: JString): JCharacterSetECI; cdecl;
    { class }     function getCharacterSetECIByValue(i: Integer): JCharacterSetECI; cdecl;
    { class }     function valueOf(string_: JString): JCharacterSetECI; cdecl;
    { class }     function values: TJavaObjectArray<JCharacterSetECI>; cdecl;
    // Deprecated
    { class }     property ASCII: JCharacterSetECI read _GetASCII;
    { class }     property Big5: JCharacterSetECI read _GetBig5;
    { class }     property Cp1250: JCharacterSetECI read _GetCp1250;
    { class }     property Cp1251: JCharacterSetECI read _GetCp1251;
    { class }     property Cp1252: JCharacterSetECI read _GetCp1252;
    { class }     property Cp1256: JCharacterSetECI read _GetCp1256;
    { class }     property Cp437: JCharacterSetECI read _GetCp437;
    { class }     property EUC_KR: JCharacterSetECI read _GetEUC_KR;
    { class }     property GB18030: JCharacterSetECI read _GetGB18030;
    { class }     property ISO8859_1: JCharacterSetECI read _GetISO8859_1;
    { class }     property ISO8859_10: JCharacterSetECI read _GetISO8859_10;
    { class }     property ISO8859_11: JCharacterSetECI read _GetISO8859_11;
    { class }     property ISO8859_13: JCharacterSetECI read _GetISO8859_13;
    { class }     property ISO8859_14: JCharacterSetECI read _GetISO8859_14;
    { class }     property ISO8859_15: JCharacterSetECI read _GetISO8859_15;
    { class }     property ISO8859_16: JCharacterSetECI read _GetISO8859_16;
    { class }     property ISO8859_2: JCharacterSetECI read _GetISO8859_2;
    { class }     property ISO8859_3: JCharacterSetECI read _GetISO8859_3;
    { class }     property ISO8859_4: JCharacterSetECI read _GetISO8859_4;
    { class }     property ISO8859_5: JCharacterSetECI read _GetISO8859_5;
    { class }     property ISO8859_6: JCharacterSetECI read _GetISO8859_6;
    { class }     property ISO8859_7: JCharacterSetECI read _GetISO8859_7;
    { class }     property ISO8859_8: JCharacterSetECI read _GetISO8859_8;
    { class }     property ISO8859_9: JCharacterSetECI read _GetISO8859_9;
    { class }     property SJIS: JCharacterSetECI read _GetSJIS;
    { class }     property UTF8: JCharacterSetECI read _GetUTF8;
    { class }     property UnicodeBigUnmarked: JCharacterSetECI read _GetUnicodeBigUnmarked;
  end;

  [JavaSignature('com/google/zxing/common/CharacterSetECI')]
  JCharacterSetECI = interface(JEnum)
    ['{E027BFFA-8D8E-4C7C-97B5-78F837D416BE}']
    function getCharset: JCharset; cdecl;
    function getValue: Integer; cdecl;
  end;

  TJCharacterSetECI = class(TJavaGenericImport<JCharacterSetECIClass, JCharacterSetECI>)
  end;

  JDecoderResultClass = interface(JObjectClass)
    ['{B81C1F77-3FD9-4C89-A505-7BAC702D60B6}']
    { class }
    function init(b: TJavaArray<Byte>; string_: JString; list: JList; string_1: JString): JDecoderResult; cdecl; overload;
    { class }     function init(b: TJavaArray<Byte>; string_: JString; list: JList; string_1: JString; i: Integer): JDecoderResult; cdecl; overload;
    { class }     function init(b: TJavaArray<Byte>; string_: JString; list: JList; string_1: JString; i: Integer; i1: Integer): JDecoderResult; cdecl; overload;
    { class }     function init(b: TJavaArray<Byte>; string_: JString; list: JList; string_1: JString; i: Integer; i1: Integer; i2: Integer): JDecoderResult; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/common/DecoderResult')]
  JDecoderResult = interface(JObject)
    ['{93ED0D23-11AF-4C7A-9F0E-CBEC1D9525A6}']
    function getByteSegments: JList; cdecl;
    function getECLevel: JString; cdecl;
    function getErasures: JInteger; cdecl;
    function getErrorsCorrected: JInteger; cdecl;
    function getNumBits: Integer; cdecl;
    function getOther: JObject; cdecl;
    function getRawBytes: TJavaArray<Byte>; cdecl;
    function getStructuredAppendParity: Integer; cdecl;
    function getStructuredAppendSequenceNumber: Integer; cdecl;
    function getSymbologyModifier: Integer; cdecl;
    function getText: JString; cdecl;
    function hasStructuredAppend: Boolean; cdecl;
    procedure setErasures(integer_: JInteger); cdecl;
    procedure setErrorsCorrected(integer_: JInteger); cdecl;
    procedure setNumBits(i: Integer); cdecl;
    procedure setOther(object_: JObject); cdecl;
  end;

  TJDecoderResult = class(TJavaGenericImport<JDecoderResultClass, JDecoderResult>)
  end;

  JGridSamplerClass = interface(JObjectClass)
    ['{27A5F2A5-060F-4C7C-A3D3-F45E15142836}']
    { class }
    procedure checkAndNudgePoints(bitMatrix: JBitMatrix; f: TJavaArray<Single>); cdecl;
    { class }     function getInstance: JGridSampler; cdecl;
    { class }     function init: JGridSampler; cdecl;
    { class }     procedure setGridSampler(gridSampler: JGridSampler); cdecl;
  end;

  [JavaSignature('com/google/zxing/common/GridSampler')]
  JGridSampler = interface(JObject)
    ['{60CF0877-6DB0-4B20-9D7A-4D46E583F32B}']
    function sampleGrid(bitMatrix: JBitMatrix; i: Integer; i1: Integer; perspectiveTransform: JPerspectiveTransform): JBitMatrix; cdecl; overload;
    function sampleGrid(bitMatrix: JBitMatrix; i: Integer; i1: Integer; f: Single; f1: Single; f2: Single; f3: Single; f4: Single; f5: Single; f6: Single; f7: Single; f8: Single; f9: Single; f10: Single; f11: Single; f12: Single; f13: Single; f14: Single; f15: Single): JBitMatrix; cdecl; overload;
  end;

  TJGridSampler = class(TJavaGenericImport<JGridSamplerClass, JGridSampler>)
  end;

  JDefaultGridSamplerClass = interface(JGridSamplerClass)
    ['{7E665150-93D4-41D9-955B-2197B9D1B253}']
    { class }
    function init: JDefaultGridSampler; cdecl;
  end;

  [JavaSignature('com/google/zxing/common/DefaultGridSampler')]
  JDefaultGridSampler = interface(JGridSampler)
    ['{98C720F2-2D5B-437C-9242-96D167022B2A}']
    function sampleGrid(bitMatrix: JBitMatrix; i: Integer; i1: Integer; perspectiveTransform: JPerspectiveTransform): JBitMatrix; cdecl; overload;
    function sampleGrid(bitMatrix: JBitMatrix; i: Integer; i1: Integer; f: Single; f1: Single; f2: Single; f3: Single; f4: Single; f5: Single; f6: Single; f7: Single; f8: Single; f9: Single; f10: Single; f11: Single; f12: Single; f13: Single; f14: Single; f15: Single): JBitMatrix; cdecl; overload;
  end;

  TJDefaultGridSampler = class(TJavaGenericImport<JDefaultGridSamplerClass, JDefaultGridSampler>)
  end;

  JECIEncoderSetClass = interface(JObjectClass)
    ['{DD6DC8EA-8849-4FF4-A837-832BF2504159}']
    { class }
    function _GetAssertionsDisabled: Boolean; cdecl;
    { class }     function init(string_: JString; charset: JCharset; i: Integer): JECIEncoderSet; cdecl;
    { class }     property AssertionsDisabled: Boolean read _GetAssertionsDisabled;
  end;

  [JavaSignature('com/google/zxing/common/ECIEncoderSet')]
  JECIEncoderSet = interface(JObject)
    ['{1BE21DAA-1487-4C56-B192-7E16AD040FD3}']
    function canEncode(c: Char; i: Integer): Boolean; cdecl;
    function encode(c: Char; i: Integer): TJavaArray<Byte>; cdecl; overload;
    function encode(string_: JString; i: Integer): TJavaArray<Byte>; cdecl; overload;
    function getCharset(i: Integer): JCharset; cdecl;
    function getCharsetName(i: Integer): JString; cdecl;
    function getECIValue(i: Integer): Integer; cdecl;
    function getPriorityEncoderIndex: Integer; cdecl;
    function length: Integer; cdecl;
  end;

  TJECIEncoderSet = class(TJavaGenericImport<JECIEncoderSetClass, JECIEncoderSet>)
  end;

  JECIInputClass = interface(IJavaClass)
    ['{3A19AFF1-753D-4662-BCBC-A36CA312F78B}']
  end;

  [JavaSignature('com/google/zxing/common/ECIInput')]
  JECIInput = interface(IJavaInstance)
    ['{CEA7531E-119B-45D1-BA7E-30D2DFD73E98}']
    function charAt(i: Integer): Char; cdecl;
    function getECIValue(i: Integer): Integer; cdecl;
    function haveNCharacters(i: Integer; i1: Integer): Boolean; cdecl;
    function isECI(i: Integer): Boolean; cdecl;
    function length: Integer; cdecl;
    function subSequence(i: Integer; i1: Integer): JCharSequence; cdecl;
  end;

  TJECIInput = class(TJavaGenericImport<JECIInputClass, JECIInput>)
  end;

  JECIStringBuilderClass = interface(JObjectClass)
    ['{0C8BB9AB-9397-4931-8910-D59A81A7C391}']
    { class }
    function init: JECIStringBuilder; cdecl; overload;
    { class }     function init(i: Integer): JECIStringBuilder; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/common/ECIStringBuilder')]
  JECIStringBuilder = interface(JObject)
    ['{3D988901-F899-4DA2-94BD-53103DEF6745}']
    procedure append(b: Byte); cdecl; overload;
    procedure append(string_: JString); cdecl; overload;
    procedure append(i: Integer); cdecl; overload;
    procedure append(c: Char); cdecl; overload;
    procedure appendCharacters(stringBuilder: JStringBuilder); cdecl;
    procedure appendECI(i: Integer); cdecl;
    function isEmpty: Boolean; cdecl;
    function length: Integer; cdecl;
    function toString: JString; cdecl;
  end;

  TJECIStringBuilder = class(TJavaGenericImport<JECIStringBuilderClass, JECIStringBuilder>)
  end;

  JGlobalHistogramBinarizerClass = interface(JBinarizerClass)
    ['{38D12732-B05A-4854-82D2-DF83AF623689}']
    { class }
    function init(luminanceSource: JLuminanceSource): JGlobalHistogramBinarizer; cdecl;
  end;

  [JavaSignature('com/google/zxing/common/GlobalHistogramBinarizer')]
  JGlobalHistogramBinarizer = interface(JBinarizer)
    ['{572749CC-6DF7-4A79-BCCC-4D9D1401C47C}']
    function createBinarizer(luminanceSource: JLuminanceSource): JBinarizer; cdecl;
    function getBlackMatrix: JBitMatrix; cdecl;
    function getBlackRow(i: Integer; bitArray: JBitArray): JBitArray; cdecl;
  end;

  TJGlobalHistogramBinarizer = class(TJavaGenericImport<JGlobalHistogramBinarizerClass, JGlobalHistogramBinarizer>)
  end;

  JHybridBinarizerClass = interface(JGlobalHistogramBinarizerClass)
    ['{4E5D5AA3-AF38-497F-BB43-6C4C1AA4628D}']
    { class }
    function init(luminanceSource: JLuminanceSource): JHybridBinarizer; cdecl;
  end;

  [JavaSignature('com/google/zxing/common/HybridBinarizer')]
  JHybridBinarizer = interface(JGlobalHistogramBinarizer)
    ['{771EDDA5-5D23-4090-8C0C-49F3F55BAB5A}']
    function createBinarizer(luminanceSource: JLuminanceSource): JBinarizer; cdecl;
    function getBlackMatrix: JBitMatrix; cdecl;
  end;

  TJHybridBinarizer = class(TJavaGenericImport<JHybridBinarizerClass, JHybridBinarizer>)
  end;

  JMinimalECIInputClass = interface(JECIInputClass)
    ['{D83AEAB2-2978-401B-A2E7-8C3E3DD7DF22}']
    { class }
    function init(string_: JString; charset: JCharset; i: Integer): JMinimalECIInput; cdecl;
  end;

  [JavaSignature('com/google/zxing/common/MinimalECIInput')]
  JMinimalECIInput = interface(JECIInput)
    ['{26F20598-56FF-4D60-BE53-51E3D1D80E58}']
    function charAt(i: Integer): Char; cdecl;
    function getECIValue(i: Integer): Integer; cdecl;
    function getFNC1Character: Integer; cdecl;
    function haveNCharacters(i: Integer; i1: Integer): Boolean; cdecl;
    function isECI(i: Integer): Boolean; cdecl;
    function isFNC1(i: Integer): Boolean; cdecl;
    function length: Integer; cdecl;
    function subSequence(i: Integer; i1: Integer): JCharSequence; cdecl;
    function toString: JString; cdecl;
  end;

  TJMinimalECIInput = class(TJavaGenericImport<JMinimalECIInputClass, JMinimalECIInput>)
  end;

  JMinimalECIInput_1Class = interface(JObjectClass)
    ['{0A8C588E-D868-4DB3-87CF-DA325750F0E4}']
  end;

  [JavaSignature('com/google/zxing/common/MinimalECIInput$1')]
  JMinimalECIInput_1 = interface(JObject)
    ['{DE2AB9A1-ED35-4CAA-AF67-D48C8740CA19}']
  end;

  TJMinimalECIInput_1 = class(TJavaGenericImport<JMinimalECIInput_1Class, JMinimalECIInput_1>)
  end;

  JMinimalECIInput_InputEdgeClass = interface(JObjectClass)
    ['{624926FE-FE91-42E2-93CA-8936510E8811}']
  end;

  [JavaSignature('com/google/zxing/common/MinimalECIInput$InputEdge')]
  JMinimalECIInput_InputEdge = interface(JObject)
    ['{D03ED691-1C1A-4BFA-BAD8-DCED5B1D09BE}']
    function isFNC1: Boolean; cdecl;
  end;

  TJMinimalECIInput_InputEdge = class(TJavaGenericImport<JMinimalECIInput_InputEdgeClass, JMinimalECIInput_InputEdge>)
  end;

  JPerspectiveTransformClass = interface(JObjectClass)
    ['{CF6CCACC-99AF-4651-A6B5-BBB5D6C93572}']
    { class }
    function quadrilateralToQuadrilateral(f: Single; f1: Single; f2: Single; f3: Single; f4: Single; f5: Single; f6: Single; f7: Single; f8: Single; f9: Single; f10: Single; f11: Single; f12: Single; f13: Single; f14: Single; f15: Single): JPerspectiveTransform; cdecl;
    { class }     function quadrilateralToSquare(f: Single; f1: Single; f2: Single; f3: Single; f4: Single; f5: Single; f6: Single; f7: Single): JPerspectiveTransform; cdecl;
    { class }     function squareToQuadrilateral(f: Single; f1: Single; f2: Single; f3: Single; f4: Single; f5: Single; f6: Single; f7: Single): JPerspectiveTransform; cdecl;
  end;

  [JavaSignature('com/google/zxing/common/PerspectiveTransform')]
  JPerspectiveTransform = interface(JObject)
    ['{31722092-8F90-409E-BDBA-4457A66BA377}']
    function buildAdjoint: JPerspectiveTransform; cdecl;
    procedure transformPoints(f: TJavaArray<Single>); cdecl; overload;
    procedure transformPoints(f: TJavaArray<Single>; f1: TJavaArray<Single>); cdecl; overload;
  end;

  TJPerspectiveTransform = class(TJavaGenericImport<JPerspectiveTransformClass, JPerspectiveTransform>)
  end;

  Jcommon_StringUtilsClass = interface(JObjectClass)
    ['{A4474167-ACD7-41CE-8903-A31A9AD0EEDB}']
    { class }
    function _GetGB2312: JString; cdecl;
    { class }     function _GetGB2312_CHARSET: JCharset; cdecl;
    { class }     function _GetSHIFT_JIS: JString; cdecl;
    { class }     function _GetSHIFT_JIS_CHARSET: JCharset; cdecl;
    { class }     function guessCharset(b: TJavaArray<Byte>; map: JMap): JCharset; cdecl;
    { class }     function guessEncoding(b: TJavaArray<Byte>; map: JMap): JString; cdecl; // Deprecated
    { class }
    property GB2312: JString read _GetGB2312;
    { class }     property GB2312_CHARSET: JCharset read _GetGB2312_CHARSET;
    { class }     property SHIFT_JIS: JString read _GetSHIFT_JIS;
    { class }     property SHIFT_JIS_CHARSET: JCharset read _GetSHIFT_JIS_CHARSET;
  end;

  [JavaSignature('com/google/zxing/common/StringUtils')]
  Jcommon_StringUtils = interface(JObject)
    ['{0D3A2C76-C5E2-45DF-95C2-73420CBFF71C}']
  end;

  TJcommon_StringUtils = class(TJavaGenericImport<Jcommon_StringUtilsClass, Jcommon_StringUtils>)
  end;

  Jdetector_MathUtilsClass = interface(JObjectClass)
    ['{568190BD-56E1-49DD-95EB-2337C31DFB65}']
    { class }
    function distance(i: Integer; i1: Integer; i2: Integer; i3: Integer): Single; cdecl; overload;
    { class }     function distance(f: Single; f1: Single; f2: Single; f3: Single): Single; cdecl; overload;
    { class }     function round(f: Single): Integer; cdecl;
    { class }     function sum(i: TJavaArray<Integer>): Integer; cdecl;
  end;

  [JavaSignature('com/google/zxing/common/detector/MathUtils')]
  Jdetector_MathUtils = interface(JObject)
    ['{D722A221-D6EA-4010-B1C7-11D653E7C99F}']
  end;

  TJdetector_MathUtils = class(TJavaGenericImport<Jdetector_MathUtilsClass, Jdetector_MathUtils>)
  end;

  JMonochromeRectangleDetectorClass = interface(JObjectClass)
    ['{C59C88D5-7B13-4B44-8882-4AFE84460CD6}']
    { class }
    function init(bitMatrix: JBitMatrix): JMonochromeRectangleDetector; cdecl;
  end;

  [JavaSignature('com/google/zxing/common/detector/MonochromeRectangleDetector')]
  JMonochromeRectangleDetector = interface(JObject)
    ['{E0FF578A-E519-4481-BD3D-725C5C0CAD54}']
    function detect: TJavaObjectArray<JResultPoint>; cdecl;
  end;

  TJMonochromeRectangleDetector = class(TJavaGenericImport<JMonochromeRectangleDetectorClass, JMonochromeRectangleDetector>)
  end;

  JWhiteRectangleDetectorClass = interface(JObjectClass)
    ['{0B48E146-250D-4BED-9299-4B573303D570}']
    { class }
    function init(bitMatrix: JBitMatrix): JWhiteRectangleDetector; cdecl; overload;
    { class }     function init(bitMatrix: JBitMatrix; i: Integer; i1: Integer; i2: Integer): JWhiteRectangleDetector; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/common/detector/WhiteRectangleDetector')]
  JWhiteRectangleDetector = interface(JObject)
    ['{AF97550E-4F33-40C2-A665-081343C0899B}']
    function detect: TJavaObjectArray<JResultPoint>; cdecl;
  end;

  TJWhiteRectangleDetector = class(TJavaGenericImport<JWhiteRectangleDetectorClass, JWhiteRectangleDetector>)
  end;

  JGenericGFClass = interface(JObjectClass)
    ['{BBD656EC-5E6E-4745-8BCD-8B2818A0BE18}']
    { class }
    function _GetAZTEC_DATA_10: JGenericGF; cdecl;
    { class }     function _GetAZTEC_DATA_12: JGenericGF; cdecl;
    { class }     function _GetAZTEC_DATA_6: JGenericGF; cdecl;
    { class }     function _GetAZTEC_DATA_8: JGenericGF; cdecl;
    { class }     function _GetAZTEC_PARAM: JGenericGF; cdecl;
    { class }     function _GetDATA_MATRIX_FIELD_256: JGenericGF; cdecl;
    { class }     function _GetMAXICODE_FIELD_64: JGenericGF; cdecl;
    { class }     function _GetQR_CODE_FIELD_256: JGenericGF; cdecl;
    { class }     function init(i: Integer; i1: Integer; i2: Integer): JGenericGF; cdecl; // Deprecated
    { class }
    property AZTEC_DATA_10: JGenericGF read _GetAZTEC_DATA_10;
    { class }     property AZTEC_DATA_12: JGenericGF read _GetAZTEC_DATA_12;
    { class }     property AZTEC_DATA_6: JGenericGF read _GetAZTEC_DATA_6;
    { class }     property AZTEC_DATA_8: JGenericGF read _GetAZTEC_DATA_8;
    { class }     property AZTEC_PARAM: JGenericGF read _GetAZTEC_PARAM;
    { class }     property DATA_MATRIX_FIELD_256: JGenericGF read _GetDATA_MATRIX_FIELD_256;
    { class }     property MAXICODE_FIELD_64: JGenericGF read _GetMAXICODE_FIELD_64;
    { class }     property QR_CODE_FIELD_256: JGenericGF read _GetQR_CODE_FIELD_256;
  end;

  [JavaSignature('com/google/zxing/common/reedsolomon/GenericGF')]
  JGenericGF = interface(JObject)
    ['{C83E0B0B-26CC-4FB6-80CA-3F7CDEA8F47C}']
    function exp(i: Integer): Integer; cdecl;
    function getGeneratorBase: Integer; cdecl;
    function getSize: Integer; cdecl;
    function getZero: JGenericGFPoly; cdecl;
    function toString: JString; cdecl;
  end;

  TJGenericGF = class(TJavaGenericImport<JGenericGFClass, JGenericGF>)
  end;

  JGenericGFPolyClass = interface(JObjectClass)
    ['{359AB1F0-2686-4ECB-86C0-113903C4F90B}']
  end;

  [JavaSignature('com/google/zxing/common/reedsolomon/GenericGFPoly')]
  JGenericGFPoly = interface(JObject)
    ['{E7AB07B8-C1E5-4DD9-B790-AF0F0E80043E}']
    function evaluateAt(i: Integer): Integer; cdecl;
    function getCoefficients: TJavaArray<Integer>; cdecl;
    function multiplyByMonomial(i: Integer; i1: Integer): JGenericGFPoly; cdecl;
    function toString: JString; cdecl;
  end;

  TJGenericGFPoly = class(TJavaGenericImport<JGenericGFPolyClass, JGenericGFPoly>)
  end;

  JReedSolomonDecoderClass = interface(JObjectClass)
    ['{4998E127-5F42-4C01-BDE1-175EE5CBCCC9}']
    { class }
    function init(genericGF: JGenericGF): JReedSolomonDecoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/common/reedsolomon/ReedSolomonDecoder')]
  JReedSolomonDecoder = interface(JObject)
    ['{195A1DE1-979A-4588-9C37-9B9FD75C639C}']
    procedure decode(i: TJavaArray<Integer>; i1: Integer); cdecl;
    function decodeWithECCount(i: TJavaArray<Integer>; i1: Integer): Integer; cdecl;
  end;

  TJReedSolomonDecoder = class(TJavaGenericImport<JReedSolomonDecoderClass, JReedSolomonDecoder>)
  end;

  JReedSolomonEncoderClass = interface(JObjectClass)
    ['{F8489195-D937-4C39-836D-71ECD1A1439E}']
    { class }
    function init(genericGF: JGenericGF): JReedSolomonEncoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/common/reedsolomon/ReedSolomonEncoder')]
  JReedSolomonEncoder = interface(JObject)
    ['{C920A7CA-ED7F-4F60-861D-29D29B7B32E6}']
    procedure encode(i: TJavaArray<Integer>; i1: Integer); cdecl;
  end;

  TJReedSolomonEncoder = class(TJavaGenericImport<JReedSolomonEncoderClass, JReedSolomonEncoder>)
  end;

  JReedSolomonExceptionClass = interface(JExceptionClass)
    ['{BEDE7DCD-CE31-4997-A322-70DE9475D6BB}']
    { class }
    function init(string_: JString): JReedSolomonException; cdecl;
  end;

  [JavaSignature('com/google/zxing/common/reedsolomon/ReedSolomonException')]
  JReedSolomonException = interface(JException)
    ['{9E22B625-7E99-41F3-92C4-06750ACA2526}']
  end;

  TJReedSolomonException = class(TJavaGenericImport<JReedSolomonExceptionClass, JReedSolomonException>)
  end;

  JDataMatrixReaderClass = interface(Jzxing_ReaderClass)
    ['{039FA255-3448-43BD-9D63-1F3358A3D80E}']
    { class }
    function init: JDataMatrixReader; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/DataMatrixReader')]
  JDataMatrixReader = interface(Jzxing_Reader)
    ['{7F4C31D4-6BE4-44C9-98A6-71839669939A}']
    function decode(binaryBitmap: JBinaryBitmap): Jzxing_Result; cdecl; overload;
    function decode(binaryBitmap: JBinaryBitmap; map: JMap): Jzxing_Result; cdecl; overload;
    procedure reset; cdecl;
  end;

  TJDataMatrixReader = class(TJavaGenericImport<JDataMatrixReaderClass, JDataMatrixReader>)
  end;

  JDataMatrixWriterClass = interface(Jzxing_WriterClass)
    ['{EC9A35DD-E44C-48A6-B2AB-D190BEE3DB63}']
    { class }
    function init: JDataMatrixWriter; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/DataMatrixWriter')]
  JDataMatrixWriter = interface(Jzxing_Writer)
    ['{BE1F2709-05FC-4646-9B60-2D445A143FF0}']
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer): JBitMatrix; cdecl; overload;
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer; map: JMap): JBitMatrix; cdecl; overload;
  end;

  TJDataMatrixWriter = class(TJavaGenericImport<JDataMatrixWriterClass, JDataMatrixWriter>)
  end;

  JBitMatrixParserClass = interface(JObjectClass)
    ['{4EE733A2-03CB-4E2F-8643-4D51965058D9}']
    { class }
    function init(bitMatrix: JBitMatrix): JBitMatrixParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/BitMatrixParser')]
  JBitMatrixParser = interface(JObject)
    ['{E5B07A1E-BD7C-4872-9E77-160EBC2C1980}']
    function getVersion: Jdecoder_Version; cdecl;
  end;

  TJBitMatrixParser = class(TJavaGenericImport<JBitMatrixParserClass, JBitMatrixParser>)
  end;

  JDataBlockClass = interface(JObjectClass)
    ['{6347E5D4-F2EC-4B4A-BE56-835DEF26A0A0}']
    { class }
    function getDataBlocks(b: TJavaArray<Byte>; version: Jdecoder_Version): TJavaObjectArray<JDataBlock>; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/DataBlock')]
  JDataBlock = interface(JObject)
    ['{2D802A99-84E6-4261-BEDD-6BBAB6C49C64}']
    function getNumDataCodewords: Integer; cdecl;
  end;

  TJDataBlock = class(TJavaGenericImport<JDataBlockClass, JDataBlock>)
  end;

  JDecodedBitStreamParserClass = interface(JObjectClass)
    ['{A90F112E-4149-445A-A09B-4DE8487A9DBC}']
    { class }
    function decode(b: TJavaArray<Byte>): JDecoderResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/DecodedBitStreamParser')]
  JDecodedBitStreamParser = interface(JObject)
    ['{4E900FB4-E528-44BA-AFBB-656CEED6AF60}']
  end;

  TJDecodedBitStreamParser = class(TJavaGenericImport<JDecodedBitStreamParserClass, JDecodedBitStreamParser>)
  end;

  { Rever }
  JDecodedBitStreamParser_1Class = interface(JObjectClass)
    ['{5F181CD7-FE2E-4DE3-AF42-2E71C76CBB75}']
    { class }
    function _GetSwitchMapComgooglezxingDAtamatrixDECoderDECodedBitStreamParserMode: TJavaArray<Integer>; cdecl;
    { class }     property SwitchMapComgooglezxingDAtamatrixDECoderDECodedBitStreamParserMode: TJavaArray<Integer> read _GetSwitchMapComgooglezxingDAtamatrixDECoderDECodedBitStreamParserMode;
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/DecodedBitStreamParser$1')]
  JDecodedBitStreamParser_1 = interface(JObject)
    ['{5595F179-308A-419A-BB2C-7BC169B834C6}']
  end;

  TJDecodedBitStreamParser_1 = class(TJavaGenericImport<JDecodedBitStreamParser_1Class, JDecodedBitStreamParser_1>)
  end;

  JDecodedBitStreamParser_ModeClass = interface(JEnumClass)
    ['{3BD21FD0-66C0-467F-9F08-7677BD39855B}']
    { class }
    function _GetANSIX12_ENCODE: JDecodedBitStreamParser_Mode; cdecl;
    { class }     function _GetASCII_ENCODE: JDecodedBitStreamParser_Mode; cdecl;
    { class }     function _GetBASE256_ENCODE: JDecodedBitStreamParser_Mode; cdecl;
    { class }     function _GetC40_ENCODE: JDecodedBitStreamParser_Mode; cdecl;
    { class }     function _GetECI_ENCODE: JDecodedBitStreamParser_Mode; cdecl;
    { class }     function _GetEDIFACT_ENCODE: JDecodedBitStreamParser_Mode; cdecl;
    { class }     function _GetPAD_ENCODE: JDecodedBitStreamParser_Mode; cdecl;
    { class }     function _GetTEXT_ENCODE: JDecodedBitStreamParser_Mode; cdecl;
    { class }     function valueOf(string_: JString): JDecodedBitStreamParser_Mode; cdecl;
    { class }     function values: TJavaObjectArray<JDecodedBitStreamParser_Mode>; cdecl; // Deprecated
    { class }
    property ANSIX12_ENCODE: JDecodedBitStreamParser_Mode read _GetANSIX12_ENCODE;
    { class }     property ASCII_ENCODE: JDecodedBitStreamParser_Mode read _GetASCII_ENCODE;
    { class }     property BASE256_ENCODE: JDecodedBitStreamParser_Mode read _GetBASE256_ENCODE;
    { class }     property C40_ENCODE: JDecodedBitStreamParser_Mode read _GetC40_ENCODE;
    { class }     property ECI_ENCODE: JDecodedBitStreamParser_Mode read _GetECI_ENCODE;
    { class }     property EDIFACT_ENCODE: JDecodedBitStreamParser_Mode read _GetEDIFACT_ENCODE;
    { class }     property PAD_ENCODE: JDecodedBitStreamParser_Mode read _GetPAD_ENCODE;
    { class }     property TEXT_ENCODE: JDecodedBitStreamParser_Mode read _GetTEXT_ENCODE;
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode')]
  JDecodedBitStreamParser_Mode = interface(JEnum)
    ['{2906EAE7-963A-49A1-A804-49328624E970}']
  end;

  TJDecodedBitStreamParser_Mode = class(TJavaGenericImport<JDecodedBitStreamParser_ModeClass, JDecodedBitStreamParser_Mode>)
  end;

  Jdatamatrix_decoder_DecoderClass = interface(JObjectClass)
    ['{F3CEC4F8-8FF0-4146-AE5C-743BB7B093AB}']
    { class }
    function init: Jdatamatrix_decoder_Decoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/Decoder')]
  Jdatamatrix_decoder_Decoder = interface(JObject)
    ['{B7355DAF-7FE0-4B3F-B332-8482143B6430}']
    function decode(bitMatrix: JBitMatrix): JDecoderResult; cdecl; overload;
    function decode(b: TJavaBiArray<Boolean>): JDecoderResult; cdecl; overload;
  end;

  TJdatamatrix_decoder_Decoder = class(TJavaGenericImport<Jdatamatrix_decoder_DecoderClass, Jdatamatrix_decoder_Decoder>)
  end;

  Jdecoder_VersionClass = interface(JObjectClass)
    ['{B3F4A2BC-1E7F-411F-A5D4-14AFFFB26E6A}']
    { class }
    function getVersionForDimensions(i: Integer; i1: Integer): Jdecoder_Version; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/Version')]
  Jdecoder_Version = interface(JObject)
    ['{AEC6C18E-5BD1-4674-9D89-FEAAE8431D88}']
    function getDataRegionSizeColumns: Integer; cdecl;
    function getDataRegionSizeRows: Integer; cdecl;
    function getSymbolSizeColumns: Integer; cdecl;
    function getSymbolSizeRows: Integer; cdecl;
    function getTotalCodewords: Integer; cdecl;
    function getVersionNumber: Integer; cdecl;
    function toString: JString; cdecl;
  end;

  TJdecoder_Version = class(TJavaGenericImport<Jdecoder_VersionClass, Jdecoder_Version>)
  end;

  JVersion_1Class = interface(JObjectClass)
    ['{32CFEBF3-E7AF-4C19-A990-1D0C6E8C2D15}']
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/Version$1')]
  JVersion_1 = interface(JObject)
    ['{F4FD9253-24D3-4D2F-A1E1-8EAC1900D82A}']
  end;

  TJVersion_1 = class(TJavaGenericImport<JVersion_1Class, JVersion_1>)
  end;

  JVersion_ECBClass = interface(JObjectClass)
    ['{6F102F73-1171-4859-8D53-E38A92136101}']
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/Version$ECB')]
  JVersion_ECB = interface(JObject)
    ['{D409D79C-F20C-477D-9A36-AA4711815A61}']
    function getCount: Integer; cdecl;
    function getDataCodewords: Integer; cdecl;
  end;

  TJVersion_ECB = class(TJavaGenericImport<JVersion_ECBClass, JVersion_ECB>)
  end;

  JVersion_ECBlocksClass = interface(JObjectClass)
    ['{9AEE6276-452C-4A9F-8AA0-D08D77C6336B}']
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/Version$ECBlocks')]
  JVersion_ECBlocks = interface(JObject)
    ['{8085EBEC-756F-4F3D-97FD-D73E3E962B1C}']
    function getECBlocks: TJavaObjectArray<JVersion_ECB>; cdecl;
    function getECCodewords: Integer; cdecl;
  end;

  TJVersion_ECBlocks = class(TJavaGenericImport<JVersion_ECBlocksClass, JVersion_ECBlocks>)
  end;

  Jdetector_DetectorClass = interface(JObjectClass)
    ['{9741152B-C5FA-4EF2-A170-4FEA258FE501}']
    { class }
    function init(bitMatrix: JBitMatrix): Jdetector_Detector; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/detector/Detector')]
  Jdetector_Detector = interface(JObject)
    ['{6DD2F9BA-3EA2-4A54-AF5C-7BA6D195B641}']
    function detect: JDetectorResult; cdecl;
  end;

  TJdetector_Detector = class(TJavaGenericImport<Jdetector_DetectorClass, Jdetector_Detector>)
  end;

  Jdatamatrix_encoder_EncoderClass = interface(IJavaClass)
    ['{50C12FAF-523B-4675-BDAF-2BF0BAE6BE0A}']
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/Encoder')]
  Jdatamatrix_encoder_Encoder = interface(IJavaInstance)
    ['{8F2F7E65-47D1-457B-A34B-4A06B07F5BF7}']
    procedure encode(encoderContext: JEncoderContext); cdecl;
    function getEncodingMode: Integer; cdecl;
  end;

  TJdatamatrix_encoder_Encoder = class(TJavaGenericImport<Jdatamatrix_encoder_EncoderClass, Jdatamatrix_encoder_Encoder>)
  end;

  JASCIIEncoderClass = interface(Jdatamatrix_encoder_EncoderClass)
    ['{0101C16D-60E6-47A6-8C38-7F902F8EB872}']
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/ASCIIEncoder')]
  JASCIIEncoder = interface(Jdatamatrix_encoder_Encoder)
    ['{026D11B5-E160-47C2-8E62-13D4718C2D62}']
    procedure encode(encoderContext: JEncoderContext); cdecl;
    function getEncodingMode: Integer; cdecl;
  end;

  TJASCIIEncoder = class(TJavaGenericImport<JASCIIEncoderClass, JASCIIEncoder>)
  end;

  JBase256EncoderClass = interface(Jdatamatrix_encoder_EncoderClass)
    ['{736A4170-8B35-4432-A3B1-05C561F569F7}']
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/Base256Encoder')]
  JBase256Encoder = interface(Jdatamatrix_encoder_Encoder)
    ['{38D2B222-E5E5-418C-AFF8-2366429E4BC4}']
    procedure encode(encoderContext: JEncoderContext); cdecl;
    function getEncodingMode: Integer; cdecl;
  end;

  TJBase256Encoder = class(TJavaGenericImport<JBase256EncoderClass, JBase256Encoder>)
  end;

  JC40EncoderClass = interface(Jdatamatrix_encoder_EncoderClass)
    ['{67849037-5968-44A6-909F-DD7310D45AEB}']
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/C40Encoder')]
  JC40Encoder = interface(Jdatamatrix_encoder_Encoder)
    ['{31349992-B76C-4B7E-ABD3-99B5595E4DE1}']
    procedure encode(encoderContext: JEncoderContext); cdecl;
    function getEncodingMode: Integer; cdecl;
    procedure handleEOD(encoderContext: JEncoderContext; stringBuilder: JStringBuilder); cdecl;
  end;

  TJC40Encoder = class(TJavaGenericImport<JC40EncoderClass, JC40Encoder>)
  end;

  JSymbolInfoClass = interface(JObjectClass)
    ['{FCBEAF9B-78FA-4053-AFA6-579B8B29680F}']
    { class }
    function init(b: Boolean; i: Integer; i1: Integer; i2: Integer; i3: Integer; i4: Integer): JSymbolInfo; cdecl; overload;
    { class }     function lookup(i: Integer): JSymbolInfo; cdecl; overload;
    { class }     function lookup(i: Integer; symbolShapeHint: JSymbolShapeHint): JSymbolInfo; cdecl; overload;
    { class }     function lookup(i: Integer; b: Boolean; b1: Boolean): JSymbolInfo; cdecl; overload;
    { class }     function lookup(i: Integer; symbolShapeHint: JSymbolShapeHint; dimension: Jzxing_Dimension; dimension1: Jzxing_Dimension; b: Boolean): JSymbolInfo; cdecl; overload;
    { class }     procedure overrideSymbolSet(symbolInfo: TJavaObjectArray<JSymbolInfo>); cdecl; // Deprecated
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/SymbolInfo')]
  JSymbolInfo = interface(JObject)
    ['{EE209259-B691-48D7-8E1D-9BFE346BDA83}']
    function _GetmatrixHeight: Integer; cdecl;
    function _GetmatrixWidth: Integer; cdecl;
    function getCodewordCount: Integer; cdecl;
    function getDataCapacity: Integer; cdecl;
    function getDataLengthForInterleavedBlock(i: Integer): Integer; cdecl;
    function getErrorCodewords: Integer; cdecl;
    function getErrorLengthForInterleavedBlock(i: Integer): Integer; cdecl;
    function getInterleavedBlockCount: Integer; cdecl;
    function getSymbolDataHeight: Integer; cdecl;
    function getSymbolDataWidth: Integer; cdecl;
    function getSymbolHeight: Integer; cdecl;
    function getSymbolWidth: Integer; cdecl;
    function toString: JString; cdecl;
    property matrixHeight: Integer read _GetmatrixHeight;
    property matrixWidth: Integer read _GetmatrixWidth;
  end;

  TJSymbolInfo = class(TJavaGenericImport<JSymbolInfoClass, JSymbolInfo>)
  end;

  JDataMatrixSymbolInfo144Class = interface(JSymbolInfoClass)
    ['{F4D0D54F-3B81-4D0D-975C-3DB2DF5495FE}']
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/DataMatrixSymbolInfo144')]
  JDataMatrixSymbolInfo144 = interface(JSymbolInfo)
    ['{579EE80E-6E7C-4AF2-94F1-3CA8E781882E}']
    function getDataLengthForInterleavedBlock(i: Integer): Integer; cdecl;
    function getInterleavedBlockCount: Integer; cdecl;
  end;

  TJDataMatrixSymbolInfo144 = class(TJavaGenericImport<JDataMatrixSymbolInfo144Class, JDataMatrixSymbolInfo144>)
  end;

  JDefaultPlacementClass = interface(JObjectClass)
    ['{6D832D6A-F13C-4729-8E76-71074619AC31}']
    { class }
    function init(charSequence: JCharSequence; i: Integer; i1: Integer): JDefaultPlacement; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/DefaultPlacement')]
  JDefaultPlacement = interface(JObject)
    ['{F1D04E78-EC2F-4AED-97E4-6F4EAF792217}']
    function getBit(i: Integer; i1: Integer): Boolean; cdecl;
    function getNumrows: Integer; cdecl;
    procedure place; cdecl;
  end;

  TJDefaultPlacement = class(TJavaGenericImport<JDefaultPlacementClass, JDefaultPlacement>)
  end;

  JEdifactEncoderClass = interface(Jdatamatrix_encoder_EncoderClass)
    ['{987CB3CF-AAE6-473F-A95B-1AE5282BB18D}']
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/EdifactEncoder')]
  JEdifactEncoder = interface(Jdatamatrix_encoder_Encoder)
    ['{CC70BD9C-7A68-44BC-BFD1-5CD0C12E54C1}']
    procedure encode(encoderContext: JEncoderContext); cdecl;
    function getEncodingMode: Integer; cdecl;
  end;

  TJEdifactEncoder = class(TJavaGenericImport<JEdifactEncoderClass, JEdifactEncoder>)
  end;

  JEncoderContextClass = interface(JObjectClass)
    ['{B74A9146-9B20-4769-9DD2-D47C65AA768A}']
    { class }
    function init(string_: JString): JEncoderContext; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/EncoderContext')]
  JEncoderContext = interface(JObject)
    ['{15FEA605-466D-4350-8499-D7CB8DABF330}']
    function getCodewordCount: Integer; cdecl;
    function getCodeWords: JStringBuilder; cdecl;
    function getCurrent: Char; cdecl;
    function getCurrentChar: Char; cdecl;
    function getMessage: JString; cdecl;
    function getNewEncoding: Integer; cdecl;
    function getRemainingCharacters: Integer; cdecl;
    function getSymbolInfo: JSymbolInfo; cdecl;
    function hasMoreCharacters: Boolean; cdecl;
    procedure resetEncoderSignal; cdecl;
    procedure resetSymbolInfo; cdecl;
    procedure setSizeConstraints(dimension: Jzxing_Dimension; dimension1: Jzxing_Dimension); cdecl;
    procedure setSkipAtEnd(i: Integer); cdecl;
    procedure setSymbolShape(symbolShapeHint: JSymbolShapeHint); cdecl;
    procedure signalEncoderChange(i: Integer); cdecl;
    procedure updateSymbolInfo; cdecl; overload;
    procedure updateSymbolInfo(i: Integer); cdecl; overload;
    procedure writeCodeword(c: Char); cdecl;
    procedure writeCodewords(string_: JString); cdecl;
  end;

  TJEncoderContext = class(TJavaGenericImport<JEncoderContextClass, JEncoderContext>)
  end;

  JErrorCorrectionClass = interface(JObjectClass)
    ['{A8E9D326-0B14-4A40-965F-C7BD87958DEF}']
    { class }
    function encodeECC200(string_: JString; symbolInfo: JSymbolInfo): JString; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/ErrorCorrection')]
  JErrorCorrection = interface(JObject)
    ['{58610B03-211A-42D3-B0D6-90DAB9D32267}']
  end;

  TJErrorCorrection = class(TJavaGenericImport<JErrorCorrectionClass, JErrorCorrection>)
  end;

  Jencoder_HighLevelEncoderClass = interface(JObjectClass)
    ['{EA02DA40-3BE2-43D2-8842-5E7603F4BFBB}']
    { class }
    function _GetASCII_ENCODATION: Integer; cdecl;
    { class }     function _GetBASE256_ENCODATION: Integer; cdecl;
    { class }     function _GetC40_ENCODATION: Integer; cdecl;
    { class }     function _GetC40_UNLATCH: Char; cdecl;
    { class }     function _GetEDIFACT_ENCODATION: Integer; cdecl;
    { class }     function _GetLATCH_TO_ANSIX12: Char; cdecl;
    { class }     function _GetLATCH_TO_BASE256: Char; cdecl;
    { class }     function _GetLATCH_TO_C40: Char; cdecl;
    { class }     function _GetLATCH_TO_EDIFACT: Char; cdecl;
    { class }     function _GetLATCH_TO_TEXT: Char; cdecl;
    { class }     function _GetMACRO_05_HEADER: JString; cdecl;
    { class }     function _GetMACRO_06_HEADER: JString; cdecl;
    { class }     function _GetMACRO_TRAILER: JString; cdecl;
    { class }     function _GetTEXT_ENCODATION: Integer; cdecl;
    { class }     function _GetUPPER_SHIFT: Char; cdecl;
    { class }     function _GetX12_ENCODATION: Integer; cdecl;
    { class }     function _GetX12_UNLATCH: Char; cdecl;
    { class }     function determineConsecutiveDigitCount(charSequence: JCharSequence; i: Integer): Integer; cdecl;
    { class }     function encodeHighLevel(string_: JString): JString; cdecl; overload; // Deprecated
    { class }
    function encodeHighLevel(string_: JString; symbolShapeHint: JSymbolShapeHint; dimension: Jzxing_Dimension; dimension1: Jzxing_Dimension): JString; cdecl; overload;
    { class }     function encodeHighLevel(string_: JString; symbolShapeHint: JSymbolShapeHint; dimension: Jzxing_Dimension; dimension1: Jzxing_Dimension; b: Boolean): JString; cdecl; overload;
    { class }     function isDigit(c: Char): Boolean; cdecl;
    { class }     function isNativeX12(c: Char): Boolean; cdecl;
    { class }     property ASCII_ENCODATION: Integer read _GetASCII_ENCODATION;
    { class }     property BASE256_ENCODATION: Integer read _GetBASE256_ENCODATION;
    { class }     property C40_ENCODATION: Integer read _GetC40_ENCODATION;
    { class }     property C40_UNLATCH: Char read _GetC40_UNLATCH;
    { class }     property EDIFACT_ENCODATION: Integer read _GetEDIFACT_ENCODATION;
    { class }     property LATCH_TO_ANSIX12: Char read _GetLATCH_TO_ANSIX12;
    { class }     property LATCH_TO_BASE256: Char read _GetLATCH_TO_BASE256;
    { class }     property LATCH_TO_C40: Char read _GetLATCH_TO_C40;
    { class }     property LATCH_TO_EDIFACT: Char read _GetLATCH_TO_EDIFACT;
    { class }     property LATCH_TO_TEXT: Char read _GetLATCH_TO_TEXT;
    { class }     property MACRO_05_HEADER: JString read _GetMACRO_05_HEADER;
    { class }     property MACRO_06_HEADER: JString read _GetMACRO_06_HEADER;
    { class }     property MACRO_TRAILER: JString read _GetMACRO_TRAILER;
    { class }     property TEXT_ENCODATION: Integer read _GetTEXT_ENCODATION;
    { class }     property UPPER_SHIFT: Char read _GetUPPER_SHIFT;
    { class }     property X12_ENCODATION: Integer read _GetX12_ENCODATION;
    { class }     property X12_UNLATCH: Char read _GetX12_UNLATCH;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/HighLevelEncoder')]
  Jencoder_HighLevelEncoder = interface(JObject)
    ['{6B030CDB-97A3-43EF-AD70-40F0980EE13F}']
  end;

  TJencoder_HighLevelEncoder = class(TJavaGenericImport<Jencoder_HighLevelEncoderClass, Jencoder_HighLevelEncoder>)
  end;

  JMinimalEncoderClass = interface(JObjectClass)
    ['{FFEF4A38-22FE-4E99-9162-89EE0E6923F0}']
    { class }
    function _GetC40_SHIFT2_CHARS: TJavaArray<Char>; cdecl;
    { class }     function encodeHighLevel(string_: JString): JString; cdecl; overload;
    { class }     function encodeHighLevel(string_: JString; charset: JCharset; i: Integer; symbolShapeHint: JSymbolShapeHint): JString; cdecl; overload;
    { class }     function getNumberOfC40Words(input: JMinimalEncoder_Input; i: Integer; b: Boolean; i1: TJavaArray<Integer>): Integer; cdecl;
    { class }     function isExtendedASCII(c: Char; i: Integer): Boolean; cdecl;
    { class }     property C40_SHIFT2_CHARS: TJavaArray<Char> read _GetC40_SHIFT2_CHARS;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/MinimalEncoder')]
  JMinimalEncoder = interface(JObject)
    ['{27AED05E-09EC-4065-8C99-7BD712F1731D}']
  end;

  TJMinimalEncoder = class(TJavaGenericImport<JMinimalEncoderClass, JMinimalEncoder>)
  end;

  { Rever }
  JMinimalEncoder_1Class = interface(JObjectClass)
    ['{4462307F-2E39-43A6-8675-0EB34E694051}']
    { class }
    function _GetSwitchMapComgooglezxingDAtamatrixEncoderMinimalEncoderMode: TJavaArray<Integer>; cdecl;
    { class }     function _GetSwitchMapComgooglezxingDAtamatrixEncodersymbolShapeHint: TJavaArray<Integer>; cdecl;
    { class }     property SwitchMapComgooglezxingDAtamatrixEncoderMinimalEncoderMode: TJavaArray<Integer> read _GetSwitchMapComgooglezxingDAtamatrixEncoderMinimalEncoderMode;
    { class }     property SwitchMapComgooglezxingDAtamatrixEncodersymbolShapeHint: TJavaArray<Integer> read _GetSwitchMapComgooglezxingDAtamatrixEncodersymbolShapeHint;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/MinimalEncoder$1')]
  JMinimalEncoder_1 = interface(JObject)
    ['{61727F83-F562-4A45-9C41-6A6DC70E7FCF}']
  end;

  TJMinimalEncoder_1 = class(TJavaGenericImport<JMinimalEncoder_1Class, JMinimalEncoder_1>)
  end;

  { Rever }
  JMinimalEncoder_EdgeClass = interface(JObjectClass)
    ['{A167944C-4D76-4596-A7E4-75F3502D02DD}']
    { class }
    function _GetAssertionsDisabled: Boolean; cdecl;
    { class }     function getBytes(i: Integer; i1: Integer): TJavaArray<Byte>; cdecl; overload;
    { class }     property AssertionsDisabled: Boolean read _GetAssertionsDisabled;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/MinimalEncoder$Edge')]
  JMinimalEncoder_Edge = interface(JObject)
    ['{FB701CC3-8FA2-4AB2-BF8A-229441A5E72F}']
    function getB256Size: Integer; cdecl;
    function getC40Words(b: Boolean; i: Integer): TJavaArray<Byte>; cdecl;
    function getLastASCII: Integer; cdecl;
    function getPreviousStartMode: JMinimalEncoder_Mode; cdecl;
  end;

  TJMinimalEncoder_Edge = class(TJavaGenericImport<JMinimalEncoder_EdgeClass, JMinimalEncoder_Edge>)
  end;

  { Rever }
  JMinimalEncoder_InputClass = interface(JMinimalECIInputClass)
    ['{5EA8FFE4-89C1-4393-96E9-CF57497115D0}']
    { class }
    function init(string_: JString; charset: JCharset; i: Integer; symbolShapeHint: JSymbolShapeHint; i1: Integer; f1: JMinimalEncoder_1): JMinimalEncoder_Input; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/MinimalEncoder$Input')]
  JMinimalEncoder_Input = interface(JMinimalECIInput)
    ['{F3C2156B-E9F1-448E-A14F-D30181BB20D1}']
  end;

  TJMinimalEncoder_Input = class(TJavaGenericImport<JMinimalEncoder_InputClass, JMinimalEncoder_Input>)
  end;

  JMinimalEncoder_ModeClass = interface(JEnumClass)
    ['{310DD099-2B82-42E5-95C6-0489B98F7141}']
    { class }
    function _GetASCII: JMinimalEncoder_Mode; cdecl;
    { class }     function _GetB256: JMinimalEncoder_Mode; cdecl;
    { class }     function _GetC40: JMinimalEncoder_Mode; cdecl;
    { class }     function _GetEDF: JMinimalEncoder_Mode; cdecl;
    { class }     function _GetTEXT: JMinimalEncoder_Mode; cdecl;
    { class }     function _GetX12: JMinimalEncoder_Mode; cdecl;
    { class }     function valueOf(string_: JString): JMinimalEncoder_Mode; cdecl;
    { class }     function values: TJavaObjectArray<JMinimalEncoder_Mode>; cdecl;
    // Deprecated
    { class }     property ASCII: JMinimalEncoder_Mode read _GetASCII;
    { class }     property B256: JMinimalEncoder_Mode read _GetB256;
    { class }     property C40: JMinimalEncoder_Mode read _GetC40;
    { class }     property EDF: JMinimalEncoder_Mode read _GetEDF;
    { class }     property TEXT: JMinimalEncoder_Mode read _GetTEXT;
    { class }     property X12: JMinimalEncoder_Mode read _GetX12;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/MinimalEncoder$Mode')]
  JMinimalEncoder_Mode = interface(JEnum)
    ['{B0C6E72F-0661-40EE-93F3-277F998E4AF4}']
  end;

  TJMinimalEncoder_Mode = class(TJavaGenericImport<JMinimalEncoder_ModeClass, JMinimalEncoder_Mode>)
  end;

  JMinimalEncoder_ResultClass = interface(JObjectClass)
    ['{3C9B68B1-7932-449C-B960-F4CF52B095BF}']
    { class }
    function init(edge: JMinimalEncoder_Edge): JMinimalEncoder_Result; cdecl;
    { class }     function prepend(b: TJavaArray<Byte>; list: JList): Integer; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/MinimalEncoder$Result')]
  JMinimalEncoder_Result = interface(JObject)
    ['{DDE555A9-3311-4ECF-86E1-FBCC10F76379}']
    function getBytes: TJavaArray<Byte>; cdecl;
  end;

  TJMinimalEncoder_Result = class(TJavaGenericImport<JMinimalEncoder_ResultClass, JMinimalEncoder_Result>)
  end;

  JSymbolShapeHintClass = interface(JEnumClass)
    ['{C39F9DFB-FB47-4148-9086-65F91979918E}']
    { class }
    function _GetFORCE_NONE: JSymbolShapeHint; cdecl;
    { class }     function _GetFORCE_RECTANGLE: JSymbolShapeHint; cdecl;
    { class }     function _GetFORCE_SQUARE: JSymbolShapeHint; cdecl;
    { class }     function valueOf(string_: JString): JSymbolShapeHint; cdecl;
    { class }     function values: TJavaObjectArray<JSymbolShapeHint>; cdecl;
    // Deprecated
    { class }     property FORCE_NONE: JSymbolShapeHint read _GetFORCE_NONE;
    { class }     property FORCE_RECTANGLE: JSymbolShapeHint read _GetFORCE_RECTANGLE;
    { class }     property FORCE_SQUARE: JSymbolShapeHint read _GetFORCE_SQUARE;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/SymbolShapeHint')]
  JSymbolShapeHint = interface(JEnum)
    ['{36C9EFAF-0C8B-41E3-935A-E13ADD638A00}']
  end;

  TJSymbolShapeHint = class(TJavaGenericImport<JSymbolShapeHintClass, JSymbolShapeHint>)
  end;

  JTextEncoderClass = interface(JC40EncoderClass)
    ['{7F7E08B6-6F96-41B0-902F-8ED05EFE30D3}']
    { class }
    function init: JTextEncoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/TextEncoder')]
  JTextEncoder = interface(JC40Encoder)
    ['{36D69961-3F1B-487C-A63C-E93D68A05F1C}']
    function getEncodingMode: Integer; cdecl;
  end;

  TJTextEncoder = class(TJavaGenericImport<JTextEncoderClass, JTextEncoder>)
  end;

  JX12EncoderClass = interface(JC40EncoderClass)
    ['{E0757553-079A-4FC8-A416-B9F94BD2E1F7}']
    { class }
    function init: JX12Encoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/X12Encoder')]
  JX12Encoder = interface(JC40Encoder)
    ['{2B4E7CE5-E77F-4522-BA6F-569D743FA8A8}']
    procedure encode(encoderContext: JEncoderContext); cdecl;
    function getEncodingMode: Integer; cdecl;
  end;

  TJX12Encoder = class(TJavaGenericImport<JX12EncoderClass, JX12Encoder>)
  end;

  JMaxiCodeReaderClass = interface(Jzxing_ReaderClass)
    ['{CDBC04FA-C11E-4330-A869-7A9C9C3DB18F}']
    { class }
    function init: JMaxiCodeReader; cdecl;
  end;

  [JavaSignature('com/google/zxing/maxicode/MaxiCodeReader')]
  JMaxiCodeReader = interface(Jzxing_Reader)
    ['{4CBE74D1-A2F2-48B9-9195-223459DC257B}']
    function decode(binaryBitmap: JBinaryBitmap): Jzxing_Result; cdecl; overload;
    function decode(binaryBitmap: JBinaryBitmap; map: JMap): Jzxing_Result; cdecl; overload;
    procedure reset; cdecl;
  end;

  TJMaxiCodeReader = class(TJavaGenericImport<JMaxiCodeReaderClass, JMaxiCodeReader>)
  end;

  Jdecoder_BitMatrixParserClass = interface(JObjectClass)
    ['{F767A6AB-DBFE-4021-A2D7-1AECBDEED984}']
    { class }
    function init(bitMatrix: JBitMatrix): Jdecoder_BitMatrixParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/maxicode/decoder/BitMatrixParser')]
  Jdecoder_BitMatrixParser = interface(JObject)
    ['{EF1A0703-E328-4291-A177-E0628BAA021A}']
    function readCodewords: TJavaArray<Byte>; cdecl;
  end;

  TJdecoder_BitMatrixParser = class(TJavaGenericImport<Jdecoder_BitMatrixParserClass, Jdecoder_BitMatrixParser>)
  end;

  Jdecoder_DecodedBitStreamParserClass = interface(JObjectClass)
    ['{1E6BABDF-3038-4059-A30E-98399F4255BD}']
    { class }
    function decode(b: TJavaArray<Byte>; i: Integer): JDecoderResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/maxicode/decoder/DecodedBitStreamParser')]
  Jdecoder_DecodedBitStreamParser = interface(JObject)
    ['{3A5DD8DF-06EE-47C1-A701-334868FB77CA}']
  end;

  TJdecoder_DecodedBitStreamParser = class(TJavaGenericImport<Jdecoder_DecodedBitStreamParserClass, Jdecoder_DecodedBitStreamParser>)
  end;

  Jmaxicode_decoder_DecoderClass = interface(JObjectClass)
    ['{A690681A-20ED-4A14-8560-CC77C4AB7CF9}']
    { class }
    function init: Jmaxicode_decoder_Decoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/maxicode/decoder/Decoder')]
  Jmaxicode_decoder_Decoder = interface(JObject)
    ['{A215DEFA-A752-4F16-B0C3-99D924DBA4A1}']
    function decode(bitMatrix: JBitMatrix): JDecoderResult; cdecl; overload;
    function decode(bitMatrix: JBitMatrix; map: JMap): JDecoderResult; cdecl; overload;
  end;

  TJmaxicode_decoder_Decoder = class(TJavaGenericImport<Jmaxicode_decoder_DecoderClass, Jmaxicode_decoder_Decoder>)
  end;

  JByQuadrantReaderClass = interface(Jzxing_ReaderClass)
    ['{EAFD8859-3DE3-49CE-AE3E-318C21D4AE4C}']
    { class }
    function init(reader: Jzxing_Reader): JByQuadrantReader; cdecl;
  end;

  [JavaSignature('com/google/zxing/multi/ByQuadrantReader')]
  JByQuadrantReader = interface(Jzxing_Reader)
    ['{BC140720-607B-4A6F-AD86-F41A53908106}']
    function decode(binaryBitmap: JBinaryBitmap): Jzxing_Result; cdecl; overload;
    function decode(binaryBitmap: JBinaryBitmap; map: JMap): Jzxing_Result; cdecl; overload;
    procedure reset; cdecl;
  end;

  TJByQuadrantReader = class(TJavaGenericImport<JByQuadrantReaderClass, JByQuadrantReader>)
  end;

  JMultipleBarcodeReaderClass = interface(IJavaClass)
    ['{842FF3A1-67DD-451C-B9BE-C9B86EF1753D}']
  end;

  [JavaSignature('com/google/zxing/multi/MultipleBarcodeReader')]
  JMultipleBarcodeReader = interface(IJavaInstance)
    ['{3B304AA5-E434-490F-87F2-101F4DB4EF7B}']
    function decodeMultiple(binaryBitmap: JBinaryBitmap): TJavaObjectArray<Jzxing_Result>; cdecl; overload;
    function decodeMultiple(binaryBitmap: JBinaryBitmap; map: JMap): TJavaObjectArray<Jzxing_Result>; cdecl; overload;
  end;

  TJMultipleBarcodeReader = class(TJavaGenericImport<JMultipleBarcodeReaderClass, JMultipleBarcodeReader>)
  end;

  JGenericMultipleBarcodeReaderClass = interface(JMultipleBarcodeReaderClass)
    ['{420C112A-DA8B-40C9-8DC9-B167022FF84C}']
    { class }
    function init(reader: Jzxing_Reader): JGenericMultipleBarcodeReader; cdecl;
  end;

  [JavaSignature('com/google/zxing/multi/GenericMultipleBarcodeReader')]
  JGenericMultipleBarcodeReader = interface(JMultipleBarcodeReader)
    ['{C0B7B191-9174-4EF8-B744-6CD27915D592}']
    function decodeMultiple(binaryBitmap: JBinaryBitmap): TJavaObjectArray<Jzxing_Result>; cdecl; overload;
    function decodeMultiple(binaryBitmap: JBinaryBitmap; map: JMap): TJavaObjectArray<Jzxing_Result>; cdecl; overload;
  end;

  TJGenericMultipleBarcodeReader = class(TJavaGenericImport<JGenericMultipleBarcodeReaderClass, JGenericMultipleBarcodeReader>)
  end;

  JQRCodeReaderClass = interface(Jzxing_ReaderClass)
    ['{E53417AD-AFBE-4869-9C37-448189F87ECD}']
    { class }
    function init: JQRCodeReader; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/QRCodeReader')]
  JQRCodeReader = interface(Jzxing_Reader)
    ['{3224AC3E-CCCD-4C09-920F-71A1504C92BB}']
    function decode(binaryBitmap: JBinaryBitmap): Jzxing_Result; cdecl; overload;
    function decode(binaryBitmap: JBinaryBitmap; map: JMap): Jzxing_Result; cdecl; overload;
    function getDecoder: Jqrcode_decoder_Decoder; cdecl;
    procedure reset; cdecl;
  end;

  TJQRCodeReader = class(TJavaGenericImport<JQRCodeReaderClass, JQRCodeReader>)
  end;

  JQRCodeMultiReaderClass = interface(JQRCodeReaderClass)
    ['{58FA5F3F-9C8B-45C2-B2CC-64B9B3A30A3A}']
    { class }
    function init: JQRCodeMultiReader; cdecl;
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/QRCodeMultiReader')]
  JQRCodeMultiReader = interface(JQRCodeReader)
    ['{04444F5C-6F4F-45E4-B5FA-0904B8778BD1}']
    function decodeMultiple(binaryBitmap: JBinaryBitmap): TJavaObjectArray<Jzxing_Result>; cdecl; overload;
    function decodeMultiple(binaryBitmap: JBinaryBitmap; map: JMap): TJavaObjectArray<Jzxing_Result>; cdecl; overload;
  end;

  TJQRCodeMultiReader = class(TJavaGenericImport<JQRCodeMultiReaderClass, JQRCodeMultiReader>)
  end;

  JQRCodeMultiReader_1Class = interface(JObjectClass)
    ['{9E4F5100-8106-413B-995E-1645E7BED805}']
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/QRCodeMultiReader$1')]
  JQRCodeMultiReader_1 = interface(JObject)
    ['{D46948E2-8F04-4D81-AF46-CE0CD3D94720}']
  end;

  TJQRCodeMultiReader_1 = class(TJavaGenericImport<JQRCodeMultiReader_1Class, JQRCodeMultiReader_1>)
  end;

  JQRCodeMultiReader_SAComparatorClass = interface(JComparatorClass)
    ['{027CFAB9-4C27-4A8F-8010-9009F8A38709}']
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/QRCodeMultiReader$SAComparator')]
  JQRCodeMultiReader_SAComparator = interface(JComparator)
    ['{95992CE3-0F7F-441E-B475-369F3ACF057F}']
    function compare(object_: JObject; object_1: JObject): Integer; cdecl; overload;
    function compare(result: Jzxing_Result; result1: Jzxing_Result): Integer; cdecl; overload;
  end;

  TJQRCodeMultiReader_SAComparator = class(TJavaGenericImport<JQRCodeMultiReader_SAComparatorClass, JQRCodeMultiReader_SAComparator>)
  end;

  Jqrcode_detector_DetectorClass = interface(JObjectClass)
    ['{F293BF9A-3B2F-4F4B-9B11-9D4CA2732B2C}']
    { class }
    function init(bitMatrix: JBitMatrix): Jqrcode_detector_Detector; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/Detector')]
  Jqrcode_detector_Detector = interface(JObject)
    ['{EC814F59-B4C0-4EA2-8FA1-1DED52C930FD}']
    function detect: JDetectorResult; cdecl; overload;
    function detect(map: JMap): JDetectorResult; cdecl; overload;
    function getImage: JBitMatrix; cdecl;
    function processFinderPatternInfo(finderPatternInfo: JFinderPatternInfo): JDetectorResult; cdecl;
  end;

  TJqrcode_detector_Detector = class(TJavaGenericImport<Jqrcode_detector_DetectorClass, Jqrcode_detector_Detector>)
  end;

  JMultiDetectorClass = interface(Jqrcode_detector_DetectorClass)
    ['{37F2D16B-C4D2-44E4-A5C4-CBF6B5A33626}']
    { class }
    function init(bitMatrix: JBitMatrix): JMultiDetector; cdecl;
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/detector/MultiDetector')]
  JMultiDetector = interface(Jqrcode_detector_Detector)
    ['{A5CFBFDA-61B9-4868-BF70-17BBC27FACFB}']
    function detectMulti(map: JMap): TJavaObjectArray<JDetectorResult>; cdecl;
  end;

  TJMultiDetector = class(TJavaGenericImport<JMultiDetectorClass, JMultiDetector>)
  end;

  JFinderPatternFinderClass = interface(JObjectClass)
    ['{3BA963C3-6C5B-4D7B-A040-012D4993C990}']
    { class }
    function _GetMAX_MODULES: Integer; cdecl;
    { class }     procedure doClearCounts(i: TJavaArray<Integer>); cdecl;
    { class }     function foundPatternCross(i: TJavaArray<Integer>): Boolean; cdecl;
    { class }     function init(bitMatrix: JBitMatrix): JFinderPatternFinder; cdecl; overload; // Deprecated
    { class }
    function init(bitMatrix: JBitMatrix; resultPointCallback: JResultPointCallback): JFinderPatternFinder; cdecl; overload;
    { class }     property MAX_MODULES: Integer read _GetMAX_MODULES;
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/FinderPatternFinder')]
  JFinderPatternFinder = interface(JObject)
    ['{8AE638BE-FD1C-4284-B96B-60153888667D}']
  end;

  TJFinderPatternFinder = class(TJavaGenericImport<JFinderPatternFinderClass, JFinderPatternFinder>)
  end;

  JMultiFinderPatternFinderClass = interface(JFinderPatternFinderClass)
    ['{B51E2482-BAD3-4AB5-B6B6-D3271BE93708}']
    { class }
    function init(bitMatrix: JBitMatrix; resultPointCallback: JResultPointCallback): JMultiFinderPatternFinder; cdecl;
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder')]
  JMultiFinderPatternFinder = interface(JFinderPatternFinder)
    ['{B2563C4B-0F8F-4E60-8DBF-F049B24E6A75}']
    function findMulti(map: JMap): TJavaObjectArray<JFinderPatternInfo>; cdecl;
  end;

  TJMultiFinderPatternFinder = class(TJavaGenericImport<JMultiFinderPatternFinderClass, JMultiFinderPatternFinder>)
  end;

  JMultiFinderPatternFinder_1Class = interface(JObjectClass)
    ['{A0E15A52-E9AF-4A10-9D56-388E6B7A4A24}']
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$1')]
  JMultiFinderPatternFinder_1 = interface(JObject)
    ['{1D058758-E8FD-4094-BC02-94D907129472}']
  end;

  TJMultiFinderPatternFinder_1 = class(TJavaGenericImport<JMultiFinderPatternFinder_1Class, JMultiFinderPatternFinder_1>)
  end;

  JMultiFinderPatternFinder_ModuleSizeComparatorClass = interface(JComparatorClass)
    ['{8572F970-A165-40A8-B3A1-E1506B5E79A5}']
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator')]
  JMultiFinderPatternFinder_ModuleSizeComparator = interface(JComparator)
    ['{EAE6280F-6000-44E8-A9F8-F66539FA6036}']
    function compare(object_: JObject; object_1: JObject): Integer; cdecl; overload;
    function compare(finderPattern: JFinderPattern; finderPattern1: JFinderPattern): Integer; cdecl; overload;
  end;

  TJMultiFinderPatternFinder_ModuleSizeComparator = class(TJavaGenericImport<JMultiFinderPatternFinder_ModuleSizeComparatorClass, JMultiFinderPatternFinder_ModuleSizeComparator>)
  end;

  JOneDReaderClass = interface(Jzxing_ReaderClass)
    ['{95C3DE55-E7AF-453A-8EA5-B6E42FC96706}']
    { class }
    function init: JOneDReader; cdecl;
    { class }     procedure recordPatternInReverse(bitArray: JBitArray; i: Integer; i1: TJavaArray<Integer>); cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/OneDReader')]
  JOneDReader = interface(Jzxing_Reader)
    ['{EFA0939A-501B-445F-A296-BD96DEB575CE}']
    function decode(binaryBitmap: JBinaryBitmap): Jzxing_Result; cdecl; overload;
    function decode(binaryBitmap: JBinaryBitmap; map: JMap): Jzxing_Result; cdecl; overload;
    function decodeRow(i: Integer; bitArray: JBitArray; map: JMap): Jzxing_Result; cdecl;
    procedure reset; cdecl;
  end;

  TJOneDReader = class(TJavaGenericImport<JOneDReaderClass, JOneDReader>)
  end;

  JCodaBarReaderClass = interface(JOneDReaderClass)
    ['{5A0B134B-A4A0-4DAA-A414-153580490EC8}']
    { class }
    function _GetCHARACTER_ENCODINGS: TJavaArray<Integer>; cdecl;
    { class }     function init: JCodaBarReader; cdecl; // Deprecated
    { class }
    property CHARACTER_ENCODINGS: TJavaArray<Integer> read _GetCHARACTER_ENCODINGS;
  end;

  [JavaSignature('com/google/zxing/oned/CodaBarReader')]
  JCodaBarReader = interface(JOneDReader)
    ['{FAED7BC2-747C-4B11-BD43-AC1BF954C04C}']
    function decodeRow(i: Integer; bitArray: JBitArray; map: JMap): Jzxing_Result; cdecl;
  end;

  TJCodaBarReader = class(TJavaGenericImport<JCodaBarReaderClass, JCodaBarReader>)
  end;

  JOneDimensionalCodeWriterClass = interface(Jzxing_WriterClass)
    ['{B26568C5-E9C0-400E-BA5A-1CF7F58528CA}']
    { class }
    function init: JOneDimensionalCodeWriter; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/OneDimensionalCodeWriter')]
  JOneDimensionalCodeWriter = interface(Jzxing_Writer)
    ['{89F2CEA9-8274-430B-8061-44DB2654D9CB}']
    function encode(string_: JString): TJavaArray<Boolean>; cdecl; overload;
    function encode(string_: JString; map: JMap): TJavaArray<Boolean>; cdecl; overload;
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer): JBitMatrix; cdecl; overload;
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer; map: JMap): JBitMatrix; cdecl; overload;
    function getDefaultMargin: Integer; cdecl;
    function getSupportedWriteFormats: JCollection; cdecl;
  end;

  TJOneDimensionalCodeWriter = class(TJavaGenericImport<JOneDimensionalCodeWriterClass, JOneDimensionalCodeWriter>)
  end;

  JCodaBarWriterClass = interface(JOneDimensionalCodeWriterClass)
    ['{574EAC19-2F35-48CA-9A11-D8DFD9858A62}']
    { class }
    function init: JCodaBarWriter; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/CodaBarWriter')]
  JCodaBarWriter = interface(JOneDimensionalCodeWriter)
    ['{96C86E1D-DA51-4A83-B4FA-10B2D5D7ED55}']
    function encode(string_: JString): TJavaArray<Boolean>; cdecl;
    function getSupportedWriteFormats: JCollection; cdecl;
  end;

  TJCodaBarWriter = class(TJavaGenericImport<JCodaBarWriterClass, JCodaBarWriter>)
  end;

  JCode128ReaderClass = interface(JOneDReaderClass)
    ['{0B8C16C0-61FA-4FA2-85C6-8B659E5E9C5B}']
    { class }
    function _GetCODE_PATTERNS: TJavaBiArray<Integer>; cdecl;
    { class }     function init: JCode128Reader; cdecl;
    { class }     property CODE_PATTERNS: TJavaBiArray<Integer> read _GetCODE_PATTERNS;
  end;

  [JavaSignature('com/google/zxing/oned/Code128Reader')]
  JCode128Reader = interface(JOneDReader)
    ['{5611EC25-8218-4E5A-A18C-3EB870274403}']
    function decodeRow(i: Integer; bitArray: JBitArray; map: JMap): Jzxing_Result; cdecl;
  end;

  TJCode128Reader = class(TJavaGenericImport<JCode128ReaderClass, JCode128Reader>)
  end;

  JCode128WriterClass = interface(JOneDimensionalCodeWriterClass)
    ['{3A841F99-4E57-4E8F-B5D3-EFCC99B1B7C8}']
    { class }
    function init: JCode128Writer; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/Code128Writer')]
  JCode128Writer = interface(JOneDimensionalCodeWriter)
    ['{B64FC9DC-3BA8-4A52-9A78-02D413393BAC}']
    function encode(string_: JString): TJavaArray<Boolean>; cdecl; overload;
    function encode(string_: JString; map: JMap): TJavaArray<Boolean>; cdecl; overload;
    function getSupportedWriteFormats: JCollection; cdecl;
  end;

  TJCode128Writer = class(TJavaGenericImport<JCode128WriterClass, JCode128Writer>)
  end;

  { Rever }
  JCode128Writer_1Class = interface(JObjectClass)
    ['{55CBBE73-5452-4ECF-8289-508057416F2E}']
    { class }
    function _GetSwitchMapComgooglezxingonedCode128WriterMinimalEncoderCharset: TJavaArray<Integer>; cdecl;
    { class }     function _GetSwitchMapComgooglezxingonedCode128WriterMinimalEncoderLatch: TJavaArray<Integer>; cdecl;
    { class }     property SwitchMapComgooglezxingonedCode128WriterMinimalEncoderCharset: TJavaArray<Integer> read _GetSwitchMapComgooglezxingonedCode128WriterMinimalEncoderCharset;
    { class }     property SwitchMapComgooglezxingonedCode128WriterMinimalEncoderLatch: TJavaArray<Integer> read _GetSwitchMapComgooglezxingonedCode128WriterMinimalEncoderLatch;
  end;

  [JavaSignature('com/google/zxing/oned/Code128Writer$1')]
  JCode128Writer_1 = interface(JObject)
    ['{9AD619D5-1E05-4058-8580-457C49CA6D00}']
  end;

  TJCode128Writer_1 = class(TJavaGenericImport<JCode128Writer_1Class, JCode128Writer_1>)
  end;

  JCode128Writer_CTypeClass = interface(JEnumClass)
    ['{8C741E8A-1397-4AD9-83CA-29DB80EDE021}']
    { class }
    function _GetFNC_1: JCode128Writer_CType; cdecl;
    { class }     function _GetONE_DIGIT: JCode128Writer_CType; cdecl;
    { class }     function _GetTWO_DIGITS: JCode128Writer_CType; cdecl;
    { class }     function _GetUNCODABLE: JCode128Writer_CType; cdecl;
    { class }     function valueOf(string_: JString): JCode128Writer_CType; cdecl;
    { class }     function values: TJavaObjectArray<JCode128Writer_CType>; cdecl;
    // Deprecated
    { class }     property FNC_1: JCode128Writer_CType read _GetFNC_1;
    { class }     property ONE_DIGIT: JCode128Writer_CType read _GetONE_DIGIT;
    { class }     property TWO_DIGITS: JCode128Writer_CType read _GetTWO_DIGITS;
    { class }     property UNCODABLE: JCode128Writer_CType read _GetUNCODABLE;
  end;

  [JavaSignature('com/google/zxing/oned/Code128Writer$CType')]
  JCode128Writer_CType = interface(JEnum)
    ['{E59FA7C7-5A82-4A16-AF0D-62BFADFB3EDC}']
  end;

  TJCode128Writer_CType = class(TJavaGenericImport<JCode128Writer_CTypeClass, JCode128Writer_CType>)
  end;

  JCode128Writer_MinimalEncoderClass = interface(JObjectClass)
    ['{6F50B7FB-81F2-4AE7-8D05-30647BA08E88}']
    { class }
    function _GetA: JString; cdecl;
    { class }     function _GetB: JString; cdecl;
    { class }     property A: JString read _GetA;
    { class }     property b: JString read _GetB;
  end;

  [JavaSignature('com/google/zxing/oned/Code128Writer$MinimalEncoder')]
  JCode128Writer_MinimalEncoder = interface(JObject)
    ['{7B3C3FCE-4A5C-4B1E-8E6B-307CEC9D5382}']
  end;

  TJCode128Writer_MinimalEncoder = class(TJavaGenericImport<JCode128Writer_MinimalEncoderClass, JCode128Writer_MinimalEncoder>)
  end;

  JMinimalEncoder_CharsetClass = interface(JEnumClass)
    ['{560B3828-A7EC-4A07-AD12-148DAF2FE72B}']
    { class }
    function _GetA: JMinimalEncoder_Charset; cdecl;
    { class }     function _GetB: JMinimalEncoder_Charset; cdecl;
    { class }     function _GetC: JMinimalEncoder_Charset; cdecl;
    { class }     function _GetNONE: JMinimalEncoder_Charset; cdecl;
    { class }     function valueOf(string_: JString): JMinimalEncoder_Charset; cdecl;
    { class }     function values: TJavaObjectArray<JMinimalEncoder_Charset>; cdecl;
    // Deprecated
    { class }     property A: JMinimalEncoder_Charset read _GetA;
    { class }     property b: JMinimalEncoder_Charset read _GetB;
    { class }     property c: JMinimalEncoder_Charset read _GetC;
    { class }     property NONE: JMinimalEncoder_Charset read _GetNONE;
  end;

  [JavaSignature('com/google/zxing/oned/Code128Writer$MinimalEncoder$Charset')]
  JMinimalEncoder_Charset = interface(JEnum)
    ['{850E21CD-7C0F-40DF-B323-3EBB6370DB8C}']
  end;

  TJMinimalEncoder_Charset = class(TJavaGenericImport<JMinimalEncoder_CharsetClass, JMinimalEncoder_Charset>)
  end;

  JMinimalEncoder_LatchClass = interface(JEnumClass)
    ['{ABF89BF9-9B1A-4490-8CC6-1865C764E2AC}']
    { class }
    function _GetA: JMinimalEncoder_Latch; cdecl;
    { class }     function _GetB: JMinimalEncoder_Latch; cdecl;
    { class }     function _GetC: JMinimalEncoder_Latch; cdecl;
    { class }     function _GetNONE: JMinimalEncoder_Latch; cdecl;
    { class }     function _GetSHIFT: JMinimalEncoder_Latch; cdecl;
    { class }     function valueOf(string_: JString): JMinimalEncoder_Latch; cdecl;
    { class }     function values: TJavaObjectArray<JMinimalEncoder_Latch>; cdecl;
    { class }     property A: JMinimalEncoder_Latch read _GetA;
    { class }     property b: JMinimalEncoder_Latch read _GetB;
    { class }     property c: JMinimalEncoder_Latch read _GetC;
    { class }     property NONE: JMinimalEncoder_Latch read _GetNONE;
    { class }     property SHIFT: JMinimalEncoder_Latch read _GetSHIFT;
  end;

  [JavaSignature('com/google/zxing/oned/Code128Writer$MinimalEncoder$Latch')]
  JMinimalEncoder_Latch = interface(JEnum)
    ['{5B0055E3-A58E-4BD0-9DFF-7DDA5815FC80}']
  end;

  TJMinimalEncoder_Latch = class(TJavaGenericImport<JMinimalEncoder_LatchClass, JMinimalEncoder_Latch>)
  end;

  JCode39ReaderClass = interface(JOneDReaderClass)
    ['{88162709-2484-40CB-88A3-49BC58D0401B}']
    { class }
    function _GetALPHABET_STRING: JString; cdecl;
    { class }     function _GetCHARACTER_ENCODINGS: TJavaArray<Integer>; cdecl;
    { class }     function init: JCode39Reader; cdecl; overload; // Deprecated
    { class }
    function init(b: Boolean): JCode39Reader; cdecl; overload;
    { class }     function init(b: Boolean; b1: Boolean): JCode39Reader; cdecl; overload;
    { class }     property ALPHABET_STRING: JString read _GetALPHABET_STRING;
    { class }     property CHARACTER_ENCODINGS: TJavaArray<Integer> read _GetCHARACTER_ENCODINGS;
  end;

  [JavaSignature('com/google/zxing/oned/Code39Reader')]
  JCode39Reader = interface(JOneDReader)
    ['{71AE9460-E05E-4FA8-83BD-30A06807A8FB}']
    function decodeRow(i: Integer; bitArray: JBitArray; map: JMap): Jzxing_Result; cdecl;
  end;

  TJCode39Reader = class(TJavaGenericImport<JCode39ReaderClass, JCode39Reader>)
  end;

  JCode39WriterClass = interface(JOneDimensionalCodeWriterClass)
    ['{FC76B48F-D3BB-4A82-BC0D-8ECEFAC6A078}']
    { class }
    function init: JCode39Writer; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/Code39Writer')]
  JCode39Writer = interface(JOneDimensionalCodeWriter)
    ['{18BAC023-4338-4FF8-8AD6-D001F5FE55F3}']
    function encode(string_: JString): TJavaArray<Boolean>; cdecl;
    function getSupportedWriteFormats: JCollection; cdecl;
  end;

  TJCode39Writer = class(TJavaGenericImport<JCode39WriterClass, JCode39Writer>)
  end;

  JCode93ReaderClass = interface(JOneDReaderClass)
    ['{834A7841-C289-48A7-BF64-FC6AF08CBA77}']
    { class }
    function _GetALPHABET_STRING: JString; cdecl;
    { class }     function _GetCHARACTER_ENCODINGS: TJavaArray<Integer>; cdecl;
    { class }     function init: JCode93Reader; cdecl; // Deprecated
    { class }
    property ALPHABET_STRING: JString read _GetALPHABET_STRING;
    { class }     property CHARACTER_ENCODINGS: TJavaArray<Integer> read _GetCHARACTER_ENCODINGS;
  end;

  [JavaSignature('com/google/zxing/oned/Code93Reader')]
  JCode93Reader = interface(JOneDReader)
    ['{9B322155-BB86-478C-BF9C-59C7B3DD9E18}']
    function decodeRow(i: Integer; bitArray: JBitArray; map: JMap): Jzxing_Result; cdecl;
  end;

  TJCode93Reader = class(TJavaGenericImport<JCode93ReaderClass, JCode93Reader>)
  end;

  JCode93WriterClass = interface(JOneDimensionalCodeWriterClass)
    ['{41DC4B0C-3157-4795-B994-C09D9B117FA5}']
    { class }
    function init: JCode93Writer; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/Code93Writer')]
  JCode93Writer = interface(JOneDimensionalCodeWriter)
    ['{C7894520-0769-47D8-973F-7DF66BE5BD41}']
    function encode(string_: JString): TJavaArray<Boolean>; cdecl;
    function getSupportedWriteFormats: JCollection; cdecl;
  end;

  TJCode93Writer = class(TJavaGenericImport<JCode93WriterClass, JCode93Writer>)
  end;

  JUPCEANReaderClass = interface(JOneDReaderClass)
    ['{B5DF09D8-4E72-44C1-91CA-E8040F8ADF5C}']
    { class }
    function _GetMIDDLE_PATTERN: TJavaArray<Integer>; cdecl;
    { class }     function _GetSTART_END_PATTERN: TJavaArray<Integer>; cdecl;
    { class }     function checkStandardUPCEANChecksum(charSequence: JCharSequence): Boolean; cdecl;
    { class }     function decodeDigit(bitArray: JBitArray; i: TJavaArray<Integer>; i1: Integer; i2: TJavaBiArray<Integer>): Integer; cdecl;
    { class }     function findStartGuardPattern(bitArray: JBitArray): TJavaArray<Integer>; cdecl;
    { class }     function init: JUPCEANReader; cdecl;
    { class }     property MIDDLE_PATTERN: TJavaArray<Integer> read _GetMIDDLE_PATTERN;
    { class }     property START_END_PATTERN: TJavaArray<Integer> read _GetSTART_END_PATTERN;
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANReader')]
  JUPCEANReader = interface(JOneDReader)
    ['{545E424E-E174-4168-9C05-51B70C9F34C8}']
    function decodeRow(i: Integer; bitArray: JBitArray; map: JMap): Jzxing_Result; cdecl; overload;
    function decodeRow(i: Integer; bitArray: JBitArray; i1: TJavaArray<Integer>; map: JMap): Jzxing_Result; cdecl; overload;
  end;

  TJUPCEANReader = class(TJavaGenericImport<JUPCEANReaderClass, JUPCEANReader>)
  end;

  JEAN13ReaderClass = interface(JUPCEANReaderClass)
    ['{14BE7BBB-3D3F-425C-8255-E122E28A2F03}']
    { class }
    function init: JEAN13Reader; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/EAN13Reader')]
  JEAN13Reader = interface(JUPCEANReader)
    ['{BAD8A919-0552-4761-AFF7-CC66B74E2504}']
    function decodeMiddle(bitArray: JBitArray; i: TJavaArray<Integer>; stringBuilder: JStringBuilder): Integer; cdecl;
  end;

  TJEAN13Reader = class(TJavaGenericImport<JEAN13ReaderClass, JEAN13Reader>)
  end;

  JUPCEANWriterClass = interface(JOneDimensionalCodeWriterClass)
    ['{8C589E96-A4DD-415B-BB81-399D96B2B0CA}']
    { class }
    function init: JUPCEANWriter; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANWriter')]
  JUPCEANWriter = interface(JOneDimensionalCodeWriter)
    ['{7EE5FACC-4E7A-426C-A5A0-383BC5BEE312}']
    function getDefaultMargin: Integer; cdecl;
  end;

  TJUPCEANWriter = class(TJavaGenericImport<JUPCEANWriterClass, JUPCEANWriter>)
  end;

  JEAN13WriterClass = interface(JUPCEANWriterClass)
    ['{01333F08-81DF-4FDD-8FF5-700070484CA1}']
    { class }
    function init: JEAN13Writer; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/EAN13Writer')]
  JEAN13Writer = interface(JUPCEANWriter)
    ['{6C427EE5-3DCA-4199-957D-24803616EC78}']
    function encode(string_: JString): TJavaArray<Boolean>; cdecl;
    function getSupportedWriteFormats: JCollection; cdecl;
  end;

  TJEAN13Writer = class(TJavaGenericImport<JEAN13WriterClass, JEAN13Writer>)
  end;

  JEAN8ReaderClass = interface(JUPCEANReaderClass)
    ['{BF523E33-B1B6-4D12-8212-DFBE6626FA9A}']
    { class }
    function init: JEAN8Reader; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/EAN8Reader')]
  JEAN8Reader = interface(JUPCEANReader)
    ['{108E640B-0CAE-4004-9C18-14FCC81EC1A3}']
    function decodeMiddle(bitArray: JBitArray; i: TJavaArray<Integer>; stringBuilder: JStringBuilder): Integer; cdecl;
  end;

  TJEAN8Reader = class(TJavaGenericImport<JEAN8ReaderClass, JEAN8Reader>)
  end;

  JEAN8WriterClass = interface(JUPCEANWriterClass)
    ['{29F25D78-979C-40E5-A3A2-F8933CCA9998}']
    { class }
    function init: JEAN8Writer; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/EAN8Writer')]
  JEAN8Writer = interface(JUPCEANWriter)
    ['{C9B69508-B970-4DEA-8CE6-BF237E306F4A}']
    function encode(string_: JString): TJavaArray<Boolean>; cdecl;
    function getSupportedWriteFormats: JCollection; cdecl;
  end;

  TJEAN8Writer = class(TJavaGenericImport<JEAN8WriterClass, JEAN8Writer>)
  end;

  JEANManufacturerOrgSupportClass = interface(JObjectClass)
    ['{02E1CBF5-9082-4FCC-9984-A6C51D0B85AF}']
    { class }
    function init: JEANManufacturerOrgSupport; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/EANManufacturerOrgSupport')]
  JEANManufacturerOrgSupport = interface(JObject)
    ['{874CC581-68F8-4E2C-92A4-10443D38197D}']
    function lookupCountryIdentifier(string_: JString): JString; cdecl;
  end;

  TJEANManufacturerOrgSupport = class(TJavaGenericImport<JEANManufacturerOrgSupportClass, JEANManufacturerOrgSupport>)
  end;

  JITFReaderClass = interface(JOneDReaderClass)
    ['{98C92CE1-CBE1-4CF6-9C59-39954B0772F8}']
    { class }
    function init: JITFReader; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/ITFReader')]
  JITFReader = interface(JOneDReader)
    ['{184552A7-50CB-4871-8FA1-754FCAEA14EA}']
    function decodeRow(i: Integer; bitArray: JBitArray; map: JMap): Jzxing_Result; cdecl;
  end;

  TJITFReader = class(TJavaGenericImport<JITFReaderClass, JITFReader>)
  end;

  JITFWriterClass = interface(JOneDimensionalCodeWriterClass)
    ['{168AA0B8-677B-48CE-8F77-97C60F101AE9}']
    { class }
    function init: JITFWriter; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/ITFWriter')]
  JITFWriter = interface(JOneDimensionalCodeWriter)
    ['{85B22012-1072-446C-BDFE-88DCEA7BA852}']
    function encode(string_: JString): TJavaArray<Boolean>; cdecl;
    function getSupportedWriteFormats: JCollection; cdecl;
  end;

  TJITFWriter = class(TJavaGenericImport<JITFWriterClass, JITFWriter>)
  end;

  JMultiFormatOneDReaderClass = interface(JOneDReaderClass)
    ['{16EA9F82-2909-4775-A1DF-62EA45CCC3C5}']
    { class }
    function init(map: JMap): JMultiFormatOneDReader; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/MultiFormatOneDReader')]
  JMultiFormatOneDReader = interface(JOneDReader)
    ['{C606FDD8-A13D-41B4-8697-48435D5EE36F}']
    function decodeRow(i: Integer; bitArray: JBitArray; map: JMap): Jzxing_Result; cdecl;
    procedure reset; cdecl;
  end;

  TJMultiFormatOneDReader = class(TJavaGenericImport<JMultiFormatOneDReaderClass, JMultiFormatOneDReader>)
  end;

  JMultiFormatUPCEANReaderClass = interface(JOneDReaderClass)
    ['{F28BF745-701B-41BC-A924-7032A4B2CE60}']
    { class }
    function init(map: JMap): JMultiFormatUPCEANReader; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/MultiFormatUPCEANReader')]
  JMultiFormatUPCEANReader = interface(JOneDReader)
    ['{47DACA7B-C71A-46C8-98B1-84EB213BA4F8}']
    function decodeRow(i: Integer; bitArray: JBitArray; map: JMap): Jzxing_Result; cdecl;
    procedure reset; cdecl;
  end;

  TJMultiFormatUPCEANReader = class(TJavaGenericImport<JMultiFormatUPCEANReaderClass, JMultiFormatUPCEANReader>)
  end;

  JUPCAReaderClass = interface(JUPCEANReaderClass)
    ['{CDC908E7-5654-469A-A95D-6F5A0C6E3C79}']
    { class }
    function init: JUPCAReader; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/UPCAReader')]
  JUPCAReader = interface(JUPCEANReader)
    ['{3CF71137-4F38-4EC2-B9CC-F10442769514}']
    function decode(binaryBitmap: JBinaryBitmap): Jzxing_Result; cdecl; overload;
    function decode(binaryBitmap: JBinaryBitmap; map: JMap): Jzxing_Result; cdecl; overload;
    function decodeRow(i: Integer; bitArray: JBitArray; map: JMap): Jzxing_Result; cdecl; overload;
    function decodeRow(i: Integer; bitArray: JBitArray; i1: TJavaArray<Integer>; map: JMap): Jzxing_Result; cdecl; overload;
    function getBarcodeFormat: JBarcodeFormat; cdecl;
  end;

  TJUPCAReader = class(TJavaGenericImport<JUPCAReaderClass, JUPCAReader>)
  end;

  JUPCAWriterClass = interface(Jzxing_WriterClass)
    ['{86B50DF1-C350-465A-82FE-47EE30D91D99}']
    { class }
    function init: JUPCAWriter; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/UPCAWriter')]
  JUPCAWriter = interface(Jzxing_Writer)
    ['{94C064B0-6790-4C99-9DB8-AEB344C1833C}']
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer): JBitMatrix; cdecl; overload;
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer; map: JMap): JBitMatrix; cdecl; overload;
  end;

  TJUPCAWriter = class(TJavaGenericImport<JUPCAWriterClass, JUPCAWriter>)
  end;

  JUPCEANExtension2SupportClass = interface(JObjectClass)
    ['{C18F5D70-093C-41C6-8594-017F1FDB0428}']
    { class }
    function init: JUPCEANExtension2Support; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANExtension2Support')]
  JUPCEANExtension2Support = interface(JObject)
    ['{130EA943-C7EA-4FF1-B74B-427C481A7DFE}']
    function decodeRow(i: Integer; bitArray: JBitArray; i1: TJavaArray<Integer>): Jzxing_Result; cdecl;
  end;

  TJUPCEANExtension2Support = class(TJavaGenericImport<JUPCEANExtension2SupportClass, JUPCEANExtension2Support>)
  end;

  JUPCEANExtension5SupportClass = interface(JObjectClass)
    ['{B89C7ED3-36B5-43D7-B63B-4059AB66F6ED}']
    { class }
    function init: JUPCEANExtension5Support; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANExtension5Support')]
  JUPCEANExtension5Support = interface(JObject)
    ['{E32E652A-FB56-4A8B-BE2D-98ED60CD2278}']
    function decodeRow(i: Integer; bitArray: JBitArray; i1: TJavaArray<Integer>): Jzxing_Result; cdecl;
  end;

  TJUPCEANExtension5Support = class(TJavaGenericImport<JUPCEANExtension5SupportClass, JUPCEANExtension5Support>)
  end;

  JUPCEANExtensionSupportClass = interface(JObjectClass)
    ['{E4EDE75E-989A-4C00-B8F6-F0F05E647B27}']
    { class }
    function init: JUPCEANExtensionSupport; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANExtensionSupport')]
  JUPCEANExtensionSupport = interface(JObject)
    ['{CDBAC730-AE1B-419F-BDE7-8AE8F8573705}']
    function decodeRow(i: Integer; bitArray: JBitArray; i1: Integer): Jzxing_Result; cdecl;
  end;

  TJUPCEANExtensionSupport = class(TJavaGenericImport<JUPCEANExtensionSupportClass, JUPCEANExtensionSupport>)
  end;

  JUPCEReaderClass = interface(JUPCEANReaderClass)
    ['{0B23B505-B261-4AB6-8E62-C7FF44422EFC}']
    { class }
    function _GetNUMSYS_AND_CHECK_DIGIT_PATTERNS: TJavaBiArray<Integer>; cdecl;
    { class }     function convertUPCEtoUPCA(string_: JString): JString; cdecl;
    { class }     function init: JUPCEReader; cdecl;
    { class }     property NUMSYS_AND_CHECK_DIGIT_PATTERNS: TJavaBiArray<Integer> read _GetNUMSYS_AND_CHECK_DIGIT_PATTERNS;
  end;

  [JavaSignature('com/google/zxing/oned/UPCEReader')]
  JUPCEReader = interface(JUPCEANReader)
    ['{9ECFCBD1-86B1-49CD-AD9F-03B980C599BA}']
    function decodeMiddle(bitArray: JBitArray; i: TJavaArray<Integer>; stringBuilder: JStringBuilder): Integer; cdecl;
  end;

  TJUPCEReader = class(TJavaGenericImport<JUPCEReaderClass, JUPCEReader>)
  end;

  JUPCEWriterClass = interface(JUPCEANWriterClass)
    ['{EC15970F-B87A-4598-B6D6-ACE295AADAA8}']
    { class }
    function init: JUPCEWriter; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/UPCEWriter')]
  JUPCEWriter = interface(JUPCEANWriter)
    ['{16E1797D-EC9A-47E6-9ABF-7B38F36F6E7E}']
    function encode(string_: JString): TJavaArray<Boolean>; cdecl;
    function getSupportedWriteFormats: JCollection; cdecl;
  end;

  TJUPCEWriter = class(TJavaGenericImport<JUPCEWriterClass, JUPCEWriter>)
  end;

  JAbstractRSSReaderClass = interface(JOneDReaderClass)
    ['{0A875DF5-376C-40A3-B558-9728669A5E79}']
    { class }
    procedure increment(i: TJavaArray<Integer>; f: TJavaArray<Single>); cdecl;
    { class }     function init: JAbstractRSSReader; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/AbstractRSSReader')]
  JAbstractRSSReader = interface(JOneDReader)
    ['{06FD7ECA-D09E-43E6-83B4-19D0BB805881}']
    function getDecodeFinderCounters: TJavaArray<Integer>; cdecl;
    function getOddCounts: TJavaArray<Integer>; cdecl;
  end;

  TJAbstractRSSReader = class(TJavaGenericImport<JAbstractRSSReaderClass, JAbstractRSSReader>)
  end;

  JDataCharacterClass = interface(JObjectClass)
    ['{538672F0-F142-4596-AEFB-2CBFB8EDD05D}']
    { class }
    function init(i: Integer; i1: Integer): JDataCharacter; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/DataCharacter')]
  JDataCharacter = interface(JObject)
    ['{5BE31019-67B4-494E-91C8-A9DC79588E06}']
    function equals(object_: JObject): Boolean; cdecl;
    function getChecksumPortion: Integer; cdecl;
    function getValue: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;

  TJDataCharacter = class(TJavaGenericImport<JDataCharacterClass, JDataCharacter>)
  end;

  Jrss_FinderPatternClass = interface(JObjectClass)
    ['{8C060622-4573-47B2-ABF4-AEE76243BC72}']
    { class }
    function init(i: Integer; i1: TJavaArray<Integer>; i2: Integer; i3: Integer; i4: Integer): Jrss_FinderPattern; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/FinderPattern')]
  Jrss_FinderPattern = interface(JObject)
    ['{9050D97E-F588-488A-9CC9-7B8944112969}']
    function equals(object_: JObject): Boolean; cdecl;
    function getResultPoints: TJavaObjectArray<JResultPoint>; cdecl;
    function getStartEnd: TJavaArray<Integer>; cdecl;
    function getValue: Integer; cdecl;
    function hashCode: Integer; cdecl;
  end;

  TJrss_FinderPattern = class(TJavaGenericImport<Jrss_FinderPatternClass, Jrss_FinderPattern>)
  end;

  Jrss_PairClass = interface(JDataCharacterClass)
    ['{2605F449-4B1C-4922-9FCB-C62955A38252}']
    { class }
    function init(i: Integer; i1: Integer; finderPattern: Jrss_FinderPattern): Jrss_Pair; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/Pair')]
  Jrss_Pair = interface(JDataCharacter)
    ['{A33ADB02-A6EA-4827-A58D-451DC55C29A3}']
    function getFinderPattern: Jrss_FinderPattern; cdecl;
  end;

  TJrss_Pair = class(TJavaGenericImport<Jrss_PairClass, Jrss_Pair>)
  end;

  JRSS14ReaderClass = interface(JAbstractRSSReaderClass)
    ['{E5DC3C10-9BE6-4190-B5E8-DBC5301E9F57}']
    { class }
    function init: JRSS14Reader; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/RSS14Reader')]
  JRSS14Reader = interface(JAbstractRSSReader)
    ['{76E144E5-FD3B-4C7F-A66B-460154082199}']
    function decodeRow(i: Integer; bitArray: JBitArray; map: JMap): Jzxing_Result; cdecl;
    procedure reset; cdecl;
  end;

  TJRSS14Reader = class(TJavaGenericImport<JRSS14ReaderClass, JRSS14Reader>)
  end;

  JRSSUtilsClass = interface(JObjectClass)
    ['{123270FC-665D-43EB-BD9A-F0C4DFDAE20D}']
    { class }
    function getRSSvalue(i: TJavaArray<Integer>; i1: Integer; b: Boolean): Integer; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/RSSUtils')]
  JRSSUtils = interface(JObject)
    ['{023410EA-9A58-4D37-95E2-1747126B9EE9}']
  end;

  TJRSSUtils = class(TJavaGenericImport<JRSSUtilsClass, JRSSUtils>)
  end;

  JBitArrayBuilderClass = interface(JObjectClass)
    ['{5ED34804-1F21-4EE9-B6A1-C470B7FD275A}']
    { class }
    function buildBitArray(list: JList): JBitArray; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/BitArrayBuilder')]
  JBitArrayBuilder = interface(JObject)
    ['{C88CB112-FFAE-4552-AEA7-44D474BCBCF4}']
  end;

  TJBitArrayBuilder = class(TJavaGenericImport<JBitArrayBuilderClass, JBitArrayBuilder>)
  end;

  JExpandedPairClass = interface(JObjectClass)
    ['{E7D24235-B544-4D35-98AC-AD629BAA69B1}']
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/ExpandedPair')]
  JExpandedPair = interface(JObject)
    ['{F7721CA8-99B4-4EF0-B188-5F6C9C6308FF}']
    function equals(object_: JObject): Boolean; cdecl;
    function getLeftChar: JDataCharacter; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;

  TJExpandedPair = class(TJavaGenericImport<JExpandedPairClass, JExpandedPair>)
  end;

  JExpandedRowClass = interface(JObjectClass)
    ['{C675F23C-C88D-4C53-BE44-F8BE260A20A1}']
    { class }
    function init(list: JList; i: Integer): JExpandedRow; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/ExpandedRow')]
  JExpandedRow = interface(JObject)
    ['{CC145F09-D559-42A6-8F8F-138B574C0DE9}']
    function equals(object_: JObject): Boolean; cdecl;
    function getPairs: JList; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;

  TJExpandedRow = class(TJavaGenericImport<JExpandedRowClass, JExpandedRow>)
  end;

  JRSSExpandedReaderClass = interface(JAbstractRSSReaderClass)
    ['{45ECFA48-D6F1-46C2-9E04-8DA792B06487}']
    { class }
    function constructResult(list: JList): Jzxing_Result; cdecl;
    { class }     function init: JRSSExpandedReader; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/RSSExpandedReader')]
  JRSSExpandedReader = interface(JAbstractRSSReader)
    ['{239DF639-CDE0-4524-B0DB-5593B87300BE}']
    function decodeRow(i: Integer; bitArray: JBitArray; map: JMap): Jzxing_Result; cdecl;
    procedure reset; cdecl;
  end;

  TJRSSExpandedReader = class(TJavaGenericImport<JRSSExpandedReaderClass, JRSSExpandedReader>)
  end;

  JAbstractExpandedDecoderClass = interface(JObjectClass)
    ['{0EDD6C82-25E0-4F3B-8BAE-9269441DA7CD}']
    { class }
    function createDecoder(bitArray: JBitArray): JAbstractExpandedDecoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder')]
  JAbstractExpandedDecoder = interface(JObject)
    ['{776B44D5-977E-45BF-AB28-EBEF98D8E02D}']
    function getInformation: JBitArray; cdecl;
    function parseInformation: JString; cdecl;
  end;

  TJAbstractExpandedDecoder = class(TJavaGenericImport<JAbstractExpandedDecoderClass, JAbstractExpandedDecoder>)
  end;

  JAI01decoderClass = interface(JAbstractExpandedDecoderClass)
    ['{50F422B0-5300-4F14-ABA4-16138BC97F99}']
    { class }
    function init(bitArray: JBitArray): JAI01decoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01decoder')]
  JAI01decoder = interface(JAbstractExpandedDecoder)
    ['{387C9E19-3F9C-4152-BFFA-7E3F315AE26F}']
    procedure encodeCompressedGtin(stringBuilder: JStringBuilder; i: Integer); cdecl;
  end;

  TJAI01decoder = class(TJavaGenericImport<JAI01decoderClass, JAI01decoder>)
  end;

  JAI01weightDecoderClass = interface(JAI01decoderClass)
    ['{139A184B-58E3-4EB6-ADB1-08750896125C}']
    { class }
    function init(bitArray: JBitArray): JAI01weightDecoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder')]
  JAI01weightDecoder = interface(JAI01decoder)
    ['{D7157746-8A3A-4766-A7DC-54B3370B52A2}']
    procedure encodeCompressedWeight(stringBuilder: JStringBuilder; i: Integer; i1: Integer); cdecl;
  end;

  TJAI01weightDecoder = class(TJavaGenericImport<JAI01weightDecoderClass, JAI01weightDecoder>)
  end;

  JAI013x0xDecoderClass = interface(JAI01weightDecoderClass)
    ['{363DECED-B83E-4B27-B911-750DF34BD9C6}']
    { class }
    function init(bitArray: JBitArray): JAI013x0xDecoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder')]
  JAI013x0xDecoder = interface(JAI01weightDecoder)
    ['{29C93E43-5447-46FE-AF7B-FBF1C80942AC}']
    function parseInformation: JString; cdecl;
  end;

  TJAI013x0xDecoder = class(TJavaGenericImport<JAI013x0xDecoderClass, JAI013x0xDecoder>)
  end;

  JAI013103decoderClass = interface(JAI013x0xDecoderClass)
    ['{CACFE474-975E-4F00-90AB-9A311AE206D6}']
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI013103decoder')]
  JAI013103decoder = interface(JAI013x0xDecoder)
    ['{8B2E3EFA-7650-4E74-8E2B-5A92A5E05782}']
    procedure addWeightCode(stringBuilder: JStringBuilder; i: Integer); cdecl;
  end;

  TJAI013103decoder = class(TJavaGenericImport<JAI013103decoderClass, JAI013103decoder>)
  end;

  JAI01320xDecoderClass = interface(JAI013x0xDecoderClass)
    ['{B1C1B098-D4C8-4895-A454-B1456BE28785}']
    { class }
    function init(bitArray: JBitArray): JAI01320xDecoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01320xDecoder')]
  JAI01320xDecoder = interface(JAI013x0xDecoder)
    ['{7BA06F45-7BB2-49C5-9176-FE64F2F5880F}']
    procedure addWeightCode(stringBuilder: JStringBuilder; i: Integer); cdecl;
  end;

  TJAI01320xDecoder = class(TJavaGenericImport<JAI01320xDecoderClass, JAI01320xDecoder>)
  end;

  JAI01392xDecoderClass = interface(JAI01decoderClass)
    ['{B94F1447-0C7D-40C9-BC18-03A15434A2D0}']
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01392xDecoder')]
  JAI01392xDecoder = interface(JAI01decoder)
    ['{C37E033E-3D06-42E3-B48D-E1DC27697AF9}']
    function parseInformation: JString; cdecl;
  end;

  TJAI01392xDecoder = class(TJavaGenericImport<JAI01392xDecoderClass, JAI01392xDecoder>)
  end;

  JAI01393xDecoderClass = interface(JAI01decoderClass)
    ['{CFF7A9AB-8C58-4F11-8729-F31EB07F397F}']
    { class }
    function init(bitArray: JBitArray): JAI01393xDecoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01393xDecoder')]
  JAI01393xDecoder = interface(JAI01decoder)
    ['{0F99CA00-011B-4D7C-AE91-358F889AE3FB}']
    function parseInformation: JString; cdecl;
  end;

  TJAI01393xDecoder = class(TJavaGenericImport<JAI01393xDecoderClass, JAI01393xDecoder>)
  end;

  JAI013x0x1xDecoderClass = interface(JAI01weightDecoderClass)
    ['{E79ADC15-B51E-4568-9D7F-79B619CBE55F}']
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder')]
  JAI013x0x1xDecoder = interface(JAI01weightDecoder)
    ['{C3BDEFD5-08CA-4F8D-BF26-4A7B67C12946}']
    function parseInformation: JString; cdecl;
  end;

  TJAI013x0x1xDecoder = class(TJavaGenericImport<JAI013x0x1xDecoderClass, JAI013x0x1xDecoder>)
  end;

  JAI01AndOtherAIsClass = interface(JAI01decoderClass)
    ['{175825BF-01A2-46DB-8B7C-074AE54EE8C9}']
    { class }
    function init(bitArray: JBitArray): JAI01AndOtherAIs; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01AndOtherAIs')]
  JAI01AndOtherAIs = interface(JAI01decoder)
    ['{275A4F62-7835-4DD1-AF70-DF932040CA4F}']
    function parseInformation: JString; cdecl;
  end;

  TJAI01AndOtherAIs = class(TJavaGenericImport<JAI01AndOtherAIsClass, JAI01AndOtherAIs>)
  end;

  JAnyAIDecoderClass = interface(JAbstractExpandedDecoderClass)
    ['{4917CBED-CD53-4CDB-9C02-8E19E9D5D572}']
    { class }
    function init(bitArray: JBitArray): JAnyAIDecoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AnyAIDecoder')]
  JAnyAIDecoder = interface(JAbstractExpandedDecoder)
    ['{4A3F37B2-7C58-46A8-BFED-9140B3C88C2D}']
    function parseInformation: JString; cdecl;
  end;

  TJAnyAIDecoder = class(TJavaGenericImport<JAnyAIDecoderClass, JAnyAIDecoder>)
  end;

  JBlockParsedResultClass = interface(JObjectClass)
    ['{E8FAF24C-F2DC-45D4-85E4-AA0F608BC270}']
    { class }
    function init: JBlockParsedResult; cdecl; overload;
    { class }     function init(decodedInformation: JDecodedInformation; b: Boolean): JBlockParsedResult; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/BlockParsedResult')]
  JBlockParsedResult = interface(JObject)
    ['{B5A0D3CB-CEC7-4F3C-AF83-F34EA2C004BC}']
  end;

  TJBlockParsedResult = class(TJavaGenericImport<JBlockParsedResultClass, JBlockParsedResult>)
  end;

  JCurrentParsingStateClass = interface(JObjectClass)
    ['{A43341B9-E6E1-4F0C-812C-FB0C7874FC48}']
    { class }
    function init: JCurrentParsingState; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/CurrentParsingState')]
  JCurrentParsingState = interface(JObject)
    ['{17BACEEE-2109-4D72-9CBD-44A2D27E8025}']
    function getPosition: Integer; cdecl;
    function isNumeric: Boolean; cdecl;
    procedure setIsoIec646; cdecl;
  end;

  TJCurrentParsingState = class(TJavaGenericImport<JCurrentParsingStateClass, JCurrentParsingState>)
  end;

  JCurrentParsingState_StateClass = interface(JEnumClass)
    ['{71783864-FB92-45C7-A881-92CD3198B647}']
    { class }
    function _GetALPHA: JCurrentParsingState_State; cdecl;
    { class }     function _GetISO_IEC_646: JCurrentParsingState_State; cdecl;
    { class }     function _GetNUMERIC: JCurrentParsingState_State; cdecl;
    { class }     function valueOf(string_: JString): JCurrentParsingState_State; cdecl;
    { class }     function values: TJavaObjectArray<JCurrentParsingState_State>; cdecl; // Deprecated
    { class }
    property ALPHA: JCurrentParsingState_State read _GetALPHA;
    { class }     property ISO_IEC_646: JCurrentParsingState_State read _GetISO_IEC_646;
    { class }     property NUMERIC: JCurrentParsingState_State read _GetNUMERIC;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State')]
  JCurrentParsingState_State = interface(JEnum)
    ['{89D6A7F0-E830-478D-8596-D58F0D8325A8}']
  end;

  TJCurrentParsingState_State = class(TJavaGenericImport<JCurrentParsingState_StateClass, JCurrentParsingState_State>)
  end;

  JDecodedObjectClass = interface(JObjectClass)
    ['{40B90608-DDB0-49AD-9021-A1DC20EB6734}']
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/DecodedObject')]
  JDecodedObject = interface(JObject)
    ['{54916206-D00B-484C-A92D-ECE22D61B5E3}']
    function getNewPosition: Integer; cdecl;
  end;

  TJDecodedObject = class(TJavaGenericImport<JDecodedObjectClass, JDecodedObject>)
  end;

  JDecodedCharClass = interface(JDecodedObjectClass)
    ['{957115F1-91FA-40C9-932B-637349EE478E}']
    { class }
    function init(i: Integer; c: Char): JDecodedChar; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/DecodedChar')]
  JDecodedChar = interface(JDecodedObject)
    ['{B3169AF2-3DF2-438C-815A-3148582DCC06}']
    function getValue: Char; cdecl;
  end;

  TJDecodedChar = class(TJavaGenericImport<JDecodedCharClass, JDecodedChar>)
  end;

  JDecodedInformationClass = interface(JDecodedObjectClass)
    ['{B69F909C-B0FC-4EB8-8B8A-E6FBCF21DE18}']
    { class }
    function init(i: Integer; string_: JString): JDecodedInformation; cdecl; overload;
    { class }     function init(i: Integer; string_: JString; i1: Integer): JDecodedInformation; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/DecodedInformation')]
  JDecodedInformation = interface(JDecodedObject)
    ['{570A2C54-C4A6-4318-9807-5B22216A3AC9}']
  end;

  TJDecodedInformation = class(TJavaGenericImport<JDecodedInformationClass, JDecodedInformation>)
  end;

  JDecodedNumericClass = interface(JDecodedObjectClass)
    ['{10AA4C1B-0D04-4559-9A4E-4430B003D813}']
    { class }
    function _GetFNC1: Integer; cdecl;
    { class }     function init(i: Integer; i1: Integer; i2: Integer): JDecodedNumeric; cdecl;
    { class }     property FNC1: Integer read _GetFNC1;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/DecodedNumeric')]
  JDecodedNumeric = interface(JDecodedObject)
    ['{C6CDB66A-8CF8-4372-8B7B-05F9FBE74B85}']
    function getFirstDigit: Integer; cdecl;
    function isSecondDigitFNC1: Boolean; cdecl;
  end;

  TJDecodedNumeric = class(TJavaGenericImport<JDecodedNumericClass, JDecodedNumeric>)
  end;

  JFieldParserClass = interface(JObjectClass)
    ['{C75A20DA-5D2A-42A8-83AA-AE5C51DE1FEB}']
    { class }
    function parseFieldsInGeneralPurpose(string_: JString): JString; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/FieldParser')]
  JFieldParser = interface(JObject)
    ['{DB57E9A2-2A39-4085-A171-AFF6441A92AD}']
  end;

  TJFieldParser = class(TJavaGenericImport<JFieldParserClass, JFieldParser>)
  end;

  JFieldParser_DataLengthClass = interface(JObjectClass)
    ['{DE96E19B-B014-4BD0-AE68-A59FCE24C2E3}']
    { class }
    function variable(i: Integer): JFieldParser_DataLength; cdecl;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/FieldParser$DataLength')]
  JFieldParser_DataLength = interface(JObject)
    ['{541EFB5E-6E31-460C-8852-1417A155922B}']
    function _Getlength: Integer; cdecl;
    function _Getvariable: Boolean; cdecl;
    property length: Integer read _Getlength;
    property variable: Boolean read _Getvariable;
  end;

  TJFieldParser_DataLength = class(TJavaGenericImport<JFieldParser_DataLengthClass, JFieldParser_DataLength>)
  end;

  JGeneralAppIdDecoderClass = interface(JObjectClass)
    ['{9EC3C032-5B4B-4DBA-AF07-D64D2622678C}']
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder')]
  JGeneralAppIdDecoder = interface(JObject)
    ['{4D4928BF-1466-40A7-AC8F-66C7B59506E8}']
    function decodeAllCodes(stringBuilder: JStringBuilder; i: Integer): JString; cdecl;
  end;

  TJGeneralAppIdDecoder = class(TJavaGenericImport<JGeneralAppIdDecoderClass, JGeneralAppIdDecoder>)
  end;

  JPDF417CommonClass = interface(JObjectClass)
    ['{1ACAE839-06FD-4AD4-8987-0817CC336ADA}']
    { class }
    function _GetBARS_IN_MODULE: Integer; cdecl;
    { class }     function _GetMAX_CODEWORDS_IN_BARCODE: Integer; cdecl;
    { class }     function _GetMAX_ROWS_IN_BARCODE: Integer; cdecl;
    { class }     function _GetMIN_ROWS_IN_BARCODE: Integer; cdecl;
    { class }     function _GetMODULES_IN_CODEWORD: Integer; cdecl;
    { class }     function _GetMODULES_IN_STOP_PATTERN: Integer; cdecl;
    { class }     function _GetNUMBER_OF_CODEWORDS: Integer; cdecl;
    { class }     function _GetSYMBOL_TABLE: TJavaArray<Integer>; cdecl;
    { class }     function getBitCountSum(i: TJavaArray<Integer>): Integer; cdecl;
    // Deprecated
    { class }     function getCodeword(i: Integer): Integer; cdecl;
    { class }     function toIntArray(collection: JCollection): TJavaArray<Integer>; cdecl;
    { class }     property BARS_IN_MODULE: Integer read _GetBARS_IN_MODULE;
    { class }     property MAX_CODEWORDS_IN_BARCODE: Integer read _GetMAX_CODEWORDS_IN_BARCODE;
    { class }     property MAX_ROWS_IN_BARCODE: Integer read _GetMAX_ROWS_IN_BARCODE;
    { class }     property MIN_ROWS_IN_BARCODE: Integer read _GetMIN_ROWS_IN_BARCODE;
    { class }     property MODULES_IN_CODEWORD: Integer read _GetMODULES_IN_CODEWORD;
    { class }     property MODULES_IN_STOP_PATTERN: Integer read _GetMODULES_IN_STOP_PATTERN;
    { class }     property NUMBER_OF_CODEWORDS: Integer read _GetNUMBER_OF_CODEWORDS;
    { class }     property SYMBOL_TABLE: TJavaArray<Integer> read _GetSYMBOL_TABLE;
  end;

  [JavaSignature('com/google/zxing/pdf417/PDF417Common')]
  JPDF417Common = interface(JObject)
    ['{7179EAD1-7C00-4DB0-8BA8-D06E66D57A67}']
  end;

  TJPDF417Common = class(TJavaGenericImport<JPDF417CommonClass, JPDF417Common>)
  end;

  JPDF417ReaderClass = interface(Jzxing_ReaderClass)
    ['{6186BCD4-0B8E-4A61-81E6-15B48A0D132A}']
    { class }
    function init: JPDF417Reader; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/PDF417Reader')]
  JPDF417Reader = interface(Jzxing_Reader)
    ['{C780459E-DE7A-40DF-9E84-CBC6580608ED}']
    function decode(binaryBitmap: JBinaryBitmap): Jzxing_Result; cdecl; overload;
    function decode(binaryBitmap: JBinaryBitmap; map: JMap): Jzxing_Result; cdecl; overload;
    function decodeMultiple(binaryBitmap: JBinaryBitmap): TJavaObjectArray<Jzxing_Result>; cdecl; overload;
    function decodeMultiple(binaryBitmap: JBinaryBitmap; map: JMap): TJavaObjectArray<Jzxing_Result>; cdecl; overload;
    procedure reset; cdecl;
  end;

  TJPDF417Reader = class(TJavaGenericImport<JPDF417ReaderClass, JPDF417Reader>)
  end;

  JPDF417ResultMetadataClass = interface(JObjectClass)
    ['{2C94FBD9-870C-4BEE-A94E-6B6532772C5E}']
    { class }
    function init: JPDF417ResultMetadata; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/PDF417ResultMetadata')]
  JPDF417ResultMetadata = interface(JObject)
    ['{34BEADAC-3CF2-4F2A-8820-38D034D86B63}']
    function getAddressee: JString; cdecl;
    function getChecksum: Integer; cdecl;
    function getFileId: JString; cdecl;
    function getFileName: JString; cdecl;
    function getFileSize: Int64; cdecl;
    function getOptionalData: TJavaArray<Integer>; cdecl;
    function getSegmentCount: Integer; cdecl;
    function getSegmentIndex: Integer; cdecl;
    function getSender: JString; cdecl;
    function getTimestamp: Int64; cdecl;
    function isLastSegment: Boolean; cdecl;
    procedure setAddressee(string_: JString); cdecl;
    procedure setChecksum(i: Integer); cdecl;
    procedure setFileId(string_: JString); cdecl;
    procedure setFileName(string_: JString); cdecl;
    procedure setFileSize(l: Int64); cdecl;
    procedure setLastSegment(b: Boolean); cdecl;
    procedure setOptionalData(i: TJavaArray<Integer>); cdecl;
    procedure setSegmentCount(i: Integer); cdecl;
    procedure setSegmentIndex(i: Integer); cdecl;
    procedure setSender(string_: JString); cdecl;
    procedure setTimestamp(l: Int64); cdecl;
  end;

  TJPDF417ResultMetadata = class(TJavaGenericImport<JPDF417ResultMetadataClass, JPDF417ResultMetadata>)
  end;

  JPDF417WriterClass = interface(Jzxing_WriterClass)
    ['{7AA638FF-9833-4E06-9A9A-6551D8D6552D}']
    { class }
    function init: JPDF417Writer; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/PDF417Writer')]
  JPDF417Writer = interface(Jzxing_Writer)
    ['{7B5D522C-3AC5-4CB5-81B9-224E6C96F8EB}']
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer): JBitMatrix; cdecl; overload;
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer; map: JMap): JBitMatrix; cdecl; overload;
  end;

  TJPDF417Writer = class(TJavaGenericImport<JPDF417WriterClass, JPDF417Writer>)
  end;

  JBarcodeMetadataClass = interface(JObjectClass)
    ['{C6F3EAD5-BE44-4DDD-B949-C4D62D2B50D2}']
    { class }
    function init(i: Integer; i1: Integer; i2: Integer; i3: Integer): JBarcodeMetadata; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/BarcodeMetadata')]
  JBarcodeMetadata = interface(JObject)
    ['{B51B97D8-19E5-4210-AC01-35B2AFD906EB}']
    function getColumnCount: Integer; cdecl;
    function getRowCountLowerPart: Integer; cdecl;
  end;

  TJBarcodeMetadata = class(TJavaGenericImport<JBarcodeMetadataClass, JBarcodeMetadata>)
  end;

  JBarcodeValueClass = interface(JObjectClass)
    ['{E1155882-66CC-4FEC-8DA5-59C3F6BE3A9B}']
    { class }
    function init: JBarcodeValue; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/BarcodeValue')]
  JBarcodeValue = interface(JObject)
    ['{F443012D-5F07-4447-99A5-F9A5F32FC8D9}']
    procedure setValue(i: Integer); cdecl;
  end;

  TJBarcodeValue = class(TJavaGenericImport<JBarcodeValueClass, JBarcodeValue>)
  end;

  JBoundingBoxClass = interface(JObjectClass)
    ['{856546D0-FD9F-4E14-B49C-B950CD2C6732}']
    { class }
    function init(boundingBox: JBoundingBox): JBoundingBox; cdecl; overload;
    { class }     function init(bitMatrix: JBitMatrix; resultPoint: JResultPoint; resultPoint1: JResultPoint; resultPoint2: JResultPoint; resultPoint3: JResultPoint): JBoundingBox; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/BoundingBox')]
  JBoundingBox = interface(JObject)
    ['{211EFAFC-0768-4EF8-97AF-04B5A9BE14CA}']
    function getMaxX: Integer; cdecl;
    function getTopRight: JResultPoint; cdecl;
  end;

  TJBoundingBox = class(TJavaGenericImport<JBoundingBoxClass, JBoundingBox>)
  end;

  JCodewordClass = interface(JObjectClass)
    ['{3C5F6A83-DADF-4480-9401-18AC53F56649}']
    { class }
    function init(i: Integer; i1: Integer; i2: Integer; i3: Integer): JCodeword; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/Codeword')]
  JCodeword = interface(JObject)
    ['{FA1B8DDA-F248-453D-A868-97FC36723EB3}']
    function getRowNumber: Integer; cdecl;
    function getStartX: Integer; cdecl;
    function hasValidRowNumber: Boolean; cdecl;
    function toString: JString; cdecl;
  end;

  TJCodeword = class(TJavaGenericImport<JCodewordClass, JCodeword>)
  end;

  Jpdf417_decoder_DecodedBitStreamParserClass = interface(JObjectClass)
    ['{0EBB734B-671B-464A-94B4-F0F1DA6EBBD9}']
    { class }
    function decode(i: TJavaArray<Integer>; string_: JString): JDecoderResult; cdecl;
    { class }     function decodeMacroBlock(i: TJavaArray<Integer>; i1: Integer; pDF417ResultMetadata: JPDF417ResultMetadata): Integer; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/DecodedBitStreamParser')]
  Jpdf417_decoder_DecodedBitStreamParser = interface(JObject)
    ['{C588A71B-4769-442D-B1C5-C43293A28708}']
  end;

  TJpdf417_decoder_DecodedBitStreamParser = class(TJavaGenericImport<Jpdf417_decoder_DecodedBitStreamParserClass, Jpdf417_decoder_DecodedBitStreamParser>)
  end;

  { Rever }
  Jdecoder_DecodedBitStreamParser_1Class = interface(JObjectClass)
    ['{9B0890A2-C6CF-487C-AC66-D7926724F3B8}']
    { class }
    function _GetSwitchMapComgooglezxingpdf417DECoderDECodedBitStreamParserMode: TJavaArray<Integer>; cdecl;
    { class }     property SwitchMapComgooglezxingpdf417DECoderDECodedBitStreamParserMode: TJavaArray<Integer> read _GetSwitchMapComgooglezxingpdf417DECoderDECodedBitStreamParserMode;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/DecodedBitStreamParser$1')]
  Jdecoder_DecodedBitStreamParser_1 = interface(JObject)
    ['{5271AFAC-2CE4-4EDF-9739-EAF1C189FF7D}']
  end;

  TJdecoder_DecodedBitStreamParser_1 = class(TJavaGenericImport<Jdecoder_DecodedBitStreamParser_1Class, Jdecoder_DecodedBitStreamParser_1>)
  end;

  Jdecoder_DecodedBitStreamParser_ModeClass = interface(JEnumClass)
    ['{1E54E563-9E35-4198-9873-4ECD723C2F45}']
    { class }
    function _GetALPHA: Jdecoder_DecodedBitStreamParser_Mode; cdecl;
    { class }     function _GetALPHA_SHIFT: Jdecoder_DecodedBitStreamParser_Mode; cdecl;
    { class }     function _GetLOWER: Jdecoder_DecodedBitStreamParser_Mode; cdecl;
    { class }     function _GetMIXED: Jdecoder_DecodedBitStreamParser_Mode; cdecl;
    { class }     function _GetPUNCT: Jdecoder_DecodedBitStreamParser_Mode; cdecl;
    { class }     function _GetPUNCT_SHIFT: Jdecoder_DecodedBitStreamParser_Mode; cdecl;
    { class }     function valueOf(string_: JString): Jdecoder_DecodedBitStreamParser_Mode; cdecl;
    { class }     function values: TJavaObjectArray<Jdecoder_DecodedBitStreamParser_Mode>; cdecl;
    // Deprecated
    { class }     property ALPHA: Jdecoder_DecodedBitStreamParser_Mode read _GetALPHA;
    { class }     property ALPHA_SHIFT: Jdecoder_DecodedBitStreamParser_Mode read _GetALPHA_SHIFT;
    { class }     property LOWER: Jdecoder_DecodedBitStreamParser_Mode read _GetLOWER;
    { class }     property MIXED: Jdecoder_DecodedBitStreamParser_Mode read _GetMIXED;
    { class }     property PUNCT: Jdecoder_DecodedBitStreamParser_Mode read _GetPUNCT;
    { class }     property PUNCT_SHIFT: Jdecoder_DecodedBitStreamParser_Mode read _GetPUNCT_SHIFT;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode')]
  Jdecoder_DecodedBitStreamParser_Mode = interface(JEnum)
    ['{FD0B78EC-7BD4-4CEC-8E39-99C7F2D3CFA0}']
  end;

  TJdecoder_DecodedBitStreamParser_Mode = class(TJavaGenericImport<Jdecoder_DecodedBitStreamParser_ModeClass, Jdecoder_DecodedBitStreamParser_Mode>)
  end;

  JDetectionResultClass = interface(JObjectClass)
    ['{B2E35EE4-EE5E-480D-BEEB-1168BE7B0656}']
    { class }
    function init(barcodeMetadata: JBarcodeMetadata; boundingBox: JBoundingBox): JDetectionResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/DetectionResult')]
  JDetectionResult = interface(JObject)
    ['{75C42EFA-C26B-4963-9A83-325C2FAF71AE}']
    function getDetectionResultColumns: TJavaObjectArray<JDetectionResultColumn>; cdecl;
    procedure setBoundingBox(boundingBox: JBoundingBox); cdecl;
    function toString: JString; cdecl;
  end;

  TJDetectionResult = class(TJavaGenericImport<JDetectionResultClass, JDetectionResult>)
  end;

  JDetectionResultColumnClass = interface(JObjectClass)
    ['{B8AE84B0-649F-447A-9970-13CE77E69B5A}']
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/DetectionResultColumn')]
  JDetectionResultColumn = interface(JObject)
    ['{26BB808F-07E8-447B-8565-A84231225D12}']
    function getBoundingBox: JBoundingBox; cdecl;
    function getCodewordNearby(i: Integer): JCodeword; cdecl;
    function toString: JString; cdecl;
  end;

  TJDetectionResultColumn = class(TJavaGenericImport<JDetectionResultColumnClass, JDetectionResultColumn>)
  end;

  JDetectionResultRowIndicatorColumnClass = interface(JDetectionResultColumnClass)
    ['{FA802874-0496-4303-8EFD-78DEEFB7EB7B}']
    { class }
    function init(boundingBox: JBoundingBox; b: Boolean): JDetectionResultRowIndicatorColumn; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn')]
  JDetectionResultRowIndicatorColumn = interface(JDetectionResultColumn)
    ['{245F12B7-20BB-47A4-97F3-1CCD03194667}']
    procedure adjustCompleteIndicatorColumnRowNumbers(barcodeMetadata: JBarcodeMetadata); cdecl;
    function toString: JString; cdecl;
  end;

  TJDetectionResultRowIndicatorColumn = class(TJavaGenericImport<JDetectionResultRowIndicatorColumnClass, JDetectionResultRowIndicatorColumn>)
  end;

  JPDF417CodewordDecoderClass = interface(JObjectClass)
    ['{A20960F5-2FD0-4BE7-9EE0-CF82A840F279}']
    { class }
    function getDecodedValue(i: TJavaArray<Integer>): Integer; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/PDF417CodewordDecoder')]
  JPDF417CodewordDecoder = interface(JObject)
    ['{353C434B-32B6-42DC-B53E-7F9900313F0A}']
  end;

  TJPDF417CodewordDecoder = class(TJavaGenericImport<JPDF417CodewordDecoderClass, JPDF417CodewordDecoder>)
  end;

  JPDF417ScanningDecoderClass = interface(JObjectClass)
    ['{E067996F-C842-48A8-8B8E-41A789D2C99A}']
    { class }
    function decode(bitMatrix: JBitMatrix; resultPoint: JResultPoint; resultPoint1: JResultPoint; resultPoint2: JResultPoint; resultPoint3: JResultPoint; i: Integer; i1: Integer): JDecoderResult; cdecl;
    { class }     function toString(barcodeValue: TJavaObjectBiArray<JBarcodeValue>): JString; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/PDF417ScanningDecoder')]
  JPDF417ScanningDecoder = interface(JObject)
    ['{BAEBB199-D0FC-4B03-BB09-AF20F6C19E96}']
  end;

  TJPDF417ScanningDecoder = class(TJavaGenericImport<JPDF417ScanningDecoderClass, JPDF417ScanningDecoder>)
  end;

  Jec_ErrorCorrectionClass = interface(JObjectClass)
    ['{8C79BD73-19BB-4494-B39D-C659B446A640}']
    { class }
    function init: Jec_ErrorCorrection; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/ec/ErrorCorrection')]
  Jec_ErrorCorrection = interface(JObject)
    ['{E5EAE91F-9638-40D8-A890-A68AF6ADE6AD}']
    function decode(i: TJavaArray<Integer>; i1: Integer; i2: TJavaArray<Integer>): Integer; cdecl;
  end;

  TJec_ErrorCorrection = class(TJavaGenericImport<Jec_ErrorCorrectionClass, Jec_ErrorCorrection>)
  end;

  JModulusGFClass = interface(JObjectClass)
    ['{1599BF49-E45D-4AA7-AF42-D5A6CD44A13A}']
    { class }
    function _GetPDF417_GF: JModulusGF; cdecl;
    { class }     property PDF417_GF: JModulusGF read _GetPDF417_GF;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/ec/ModulusGF')]
  JModulusGF = interface(JObject)
    ['{65BA6CAB-8A46-40D5-995B-7330BB7B2815}']
    function exp(i: Integer): Integer; cdecl;
    function getOne: JModulusPoly; cdecl;
    function getSize: Integer; cdecl;
    function getZero: JModulusPoly; cdecl;
  end;

  TJModulusGF = class(TJavaGenericImport<JModulusGFClass, JModulusGF>)
  end;

  JModulusPolyClass = interface(JObjectClass)
    ['{EFDD2D98-C64B-43DA-83EA-41BA6155DB3C}']
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/ec/ModulusPoly')]
  JModulusPoly = interface(JObject)
    ['{195560C4-EC88-4291-957B-972731B34EEB}']
    function evaluateAt(i: Integer): Integer; cdecl;
    function getCoefficients: TJavaArray<Integer>; cdecl;
    function negative: JModulusPoly; cdecl;
    function toString: JString; cdecl;
  end;

  TJModulusPoly = class(TJavaGenericImport<JModulusPolyClass, JModulusPoly>)
  end;

  Jpdf417_detector_DetectorClass = interface(JObjectClass)
    ['{487C8762-1B1C-41C2-A311-19A5770CACF8}']
    { class }
    function detect(binaryBitmap: JBinaryBitmap; map: JMap; b: Boolean): JPDF417DetectorResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/detector/Detector')]
  Jpdf417_detector_Detector = interface(JObject)
    ['{52E624B8-36AC-4DDC-980E-849195E9746B}']
  end;

  TJpdf417_detector_Detector = class(TJavaGenericImport<Jpdf417_detector_DetectorClass, Jpdf417_detector_Detector>)
  end;

  JPDF417DetectorResultClass = interface(JObjectClass)
    ['{2275FD06-6500-4867-A3C3-692B32F7237F}']
    { class }
    function init(bitMatrix: JBitMatrix; list: JList): JPDF417DetectorResult; cdecl; overload;
    { class }     function init(bitMatrix: JBitMatrix; list: JList; i: Integer): JPDF417DetectorResult; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/pdf417/detector/PDF417DetectorResult')]
  JPDF417DetectorResult = interface(JObject)
    ['{D2048791-5DD7-4B64-B9FB-E569C59C73DF}']
    function getBits: JBitMatrix; cdecl;
    function getPoints: JList; cdecl;
    function getRotation: Integer; cdecl;
  end;

  TJPDF417DetectorResult = class(TJavaGenericImport<JPDF417DetectorResultClass, JPDF417DetectorResult>)
  end;

  JBarcodeMatrixClass = interface(JObjectClass)
    ['{76FA5BD6-8D21-4379-A127-E3B11AAA476F}']
    { class }
    function init(i: Integer; i1: Integer): JBarcodeMatrix; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/BarcodeMatrix')]
  JBarcodeMatrix = interface(JObject)
    ['{73F388B4-3DC7-4158-B69F-960EDD4C5C68}']
    function getMatrix: TJavaBiArray<Byte>; cdecl;
    function getScaledMatrix(i: Integer; i1: Integer): TJavaBiArray<Byte>; cdecl;
    procedure &set(i: Integer; i1: Integer; b: Byte); cdecl;
  end;

  TJBarcodeMatrix = class(TJavaGenericImport<JBarcodeMatrixClass, JBarcodeMatrix>)
  end;

  JBarcodeRowClass = interface(JObjectClass)
    ['{942CCBAA-6D85-4351-AE84-141AA74D588F}']
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/BarcodeRow')]
  JBarcodeRow = interface(JObject)
    ['{D698319C-9E1D-468F-BEE7-78B6BB0FA0A8}']
    procedure &set(i: Integer; b: Byte); cdecl;
  end;

  TJBarcodeRow = class(TJavaGenericImport<JBarcodeRowClass, JBarcodeRow>)
  end;

  JCompactionClass = interface(JEnumClass)
    ['{8AD2B5A7-64B4-447F-A855-DA2AAB4A076E}']
    { class }
    function _GetAUTO: JCompaction; cdecl;
    { class }     function _GetBYTE: JCompaction; cdecl;
    { class }     function _GetNUMERIC: JCompaction; cdecl;
    { class }     function _GetTEXT: JCompaction; cdecl;
    { class }     function valueOf(string_: JString): JCompaction; cdecl;
    { class }     function values: TJavaObjectArray<JCompaction>; cdecl;
    // Deprecated
    { class }     property AUTO: JCompaction read _GetAUTO;
    { class }     property Byte: JCompaction read _GetBYTE;
    { class }     property NUMERIC: JCompaction read _GetNUMERIC;
    { class }     property TEXT: JCompaction read _GetTEXT;
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/Compaction')]
  JCompaction = interface(JEnum)
    ['{40AF1267-10D8-4B6B-BD33-1636ADC3BBD6}']
  end;

  TJCompaction = class(TJavaGenericImport<JCompactionClass, JCompaction>)
  end;

  JDimensionsClass = interface(JObjectClass)
    ['{2502DE8D-5500-4F4B-B08C-84ED343E2B9E}']
    { class }
    function init(i: Integer; i1: Integer; i2: Integer; i3: Integer): JDimensions; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/Dimensions')]
  JDimensions = interface(JObject)
    ['{C720E269-5814-4B57-BC9E-560373DC7224}']
    function getMaxCols: Integer; cdecl;
    function getMaxRows: Integer; cdecl;
    function getMinCols: Integer; cdecl;
    function getMinRows: Integer; cdecl;
  end;

  TJDimensions = class(TJavaGenericImport<JDimensionsClass, JDimensions>)
  end;

  JPDF417Class = interface(JObjectClass)
    ['{BB4DB6DE-1E8F-4FA5-AF16-61EDFC9D2315}']
    { class }
    function init: JPDF417; cdecl; overload;
    { class }     function init(b: Boolean): JPDF417; cdecl; overload;
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/PDF417')]
  JPDF417 = interface(JObject)
    ['{F2F0A20E-0B25-4E08-9072-FEA689839D96}']
    procedure generateBarcodeLogic(string_: JString; i: Integer); cdecl; overload;
    procedure generateBarcodeLogic(string_: JString; i: Integer; b: Boolean); cdecl; overload;
    function getBarcodeMatrix: JBarcodeMatrix; cdecl;
    procedure setCompact(b: Boolean); cdecl;
    procedure setCompaction(compaction: JCompaction); cdecl;
    procedure setDimensions(i: Integer; i1: Integer; i2: Integer; i3: Integer); cdecl;
    procedure setEncoding(charset: JCharset); cdecl;
  end;

  TJPDF417 = class(TJavaGenericImport<JPDF417Class, JPDF417>)
  end;

  JPDF417ErrorCorrectionClass = interface(JObjectClass)
    ['{52B00809-7954-4AFA-BB8B-DAFC7F88CFE9}']
    { class }
    function getErrorCorrectionCodewordCount(i: Integer): Integer; cdecl;
    { class }     function getRecommendedMinimumErrorCorrectionLevel(i: Integer): Integer; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/PDF417ErrorCorrection')]
  JPDF417ErrorCorrection = interface(JObject)
    ['{8E4C7380-CEE9-4206-900C-FDCC617FCDB7}']
  end;

  TJPDF417ErrorCorrection = class(TJavaGenericImport<JPDF417ErrorCorrectionClass, JPDF417ErrorCorrection>)
  end;

  JPDF417HighLevelEncoderClass = interface(JObjectClass)
    ['{A8228B6F-FD80-4564-AD5F-9EEECFA9CC4D}']
    { class }
    function _GetAssertionsDisabled: Boolean; cdecl;
    { class }     function encodeHighLevel(string_: JString; compaction: JCompaction; charset: JCharset; b: Boolean): JString; cdecl;
    { class }     function subBytes(eCIInput: JECIInput; i: Integer; i1: Integer): TJavaArray<Byte>; cdecl;
    { class }     property AssertionsDisabled: Boolean read _GetAssertionsDisabled;
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/PDF417HighLevelEncoder')]
  JPDF417HighLevelEncoder = interface(JObject)
    ['{664D896C-939D-42C1-AD37-40729B78A3CF}']
  end;

  TJPDF417HighLevelEncoder = class(TJavaGenericImport<JPDF417HighLevelEncoderClass, JPDF417HighLevelEncoder>)
  end;

  { Rever }
  JPDF417HighLevelEncoder_1Class = interface(JObjectClass)
    ['{53A99FE7-1504-4518-83A9-C88A50646ED2}']
    { class }
    function _GetSwitchMapComgooglezxingpdf417EncoderCompaction: TJavaArray<Integer>; cdecl;
    { class }     property SwitchMapComgooglezxingpdf417EncoderCompaction: TJavaArray<Integer> read _GetSwitchMapComgooglezxingpdf417EncoderCompaction;
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/PDF417HighLevelEncoder$1')]
  JPDF417HighLevelEncoder_1 = interface(JObject)
    ['{90D9E351-9FA0-4F17-A21D-180A6276C315}']
  end;

  TJPDF417HighLevelEncoder_1 = class(TJavaGenericImport<JPDF417HighLevelEncoder_1Class, JPDF417HighLevelEncoder_1>)
  end;

  JPDF417HighLevelEncoder_NoECIInputClass = interface(JECIInputClass)
    ['{4F2055A3-B0F2-4D10-BEA2-9BD373423998}']
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/PDF417HighLevelEncoder$NoECIInput')]
  JPDF417HighLevelEncoder_NoECIInput = interface(JECIInput)
    ['{DDA8BCCD-5566-4A51-BCC7-4827CED9A819}']
    function charAt(i: Integer): Char; cdecl;
    function getECIValue(i: Integer): Integer; cdecl;
    function haveNCharacters(i: Integer; i1: Integer): Boolean; cdecl;
    function isECI(i: Integer): Boolean; cdecl;
    function length: Integer; cdecl;
    function subSequence(i: Integer; i1: Integer): JCharSequence; cdecl;
    function toString: JString; cdecl;
  end;

  TJPDF417HighLevelEncoder_NoECIInput = class(TJavaGenericImport<JPDF417HighLevelEncoder_NoECIInputClass, JPDF417HighLevelEncoder_NoECIInput>)
  end;

  JPDF417HighLevelEncoderTestAdapterClass = interface(JObjectClass)
    ['{7616645C-B5B5-4A94-AA12-5E78475355B2}']
    { class }
    function encodeHighLevel(string_: JString; compaction: JCompaction; charset: JCharset; b: Boolean): JString; cdecl;
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/PDF417HighLevelEncoderTestAdapter')]
  JPDF417HighLevelEncoderTestAdapter = interface(JObject)
    ['{99C290BD-068D-4EF6-B4B3-4AC831A97A73}']
  end;

  TJPDF417HighLevelEncoderTestAdapter = class(TJavaGenericImport<JPDF417HighLevelEncoderTestAdapterClass, JPDF417HighLevelEncoderTestAdapter>)
  end;

  JQRCodeWriterClass = interface(Jzxing_WriterClass)
    ['{112C22CC-56BC-4B2B-9AD5-AA45E2B7EF70}']
    { class }
    function init: JQRCodeWriter; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/QRCodeWriter')]
  JQRCodeWriter = interface(Jzxing_Writer)
    ['{C5CB2CCE-FFD7-444A-BFB6-F2CE29FEF50F}']
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer): JBitMatrix; cdecl; overload;
    function encode(string_: JString; barcodeFormat: JBarcodeFormat; i: Integer; i1: Integer; map: JMap): JBitMatrix; cdecl; overload;
  end;

  TJQRCodeWriter = class(TJavaGenericImport<JQRCodeWriterClass, JQRCodeWriter>)
  end;

  Jqrcode_decoder_BitMatrixParserClass = interface(JObjectClass)
    ['{6348216C-5FB3-4CAF-97B7-E1800D080268}']
    { class }
    function init(bitMatrix: JBitMatrix): Jqrcode_decoder_BitMatrixParser; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/BitMatrixParser')]
  Jqrcode_decoder_BitMatrixParser = interface(JObject)
    ['{32676722-1ACA-4510-BF5F-387C1D85EE4D}']
    function readFormatInformation: JFormatInformation; cdecl;
    procedure setMirror(b: Boolean); cdecl;
  end;

  TJqrcode_decoder_BitMatrixParser = class(TJavaGenericImport<Jqrcode_decoder_BitMatrixParserClass, Jqrcode_decoder_BitMatrixParser>)
  end;

  Jdecoder_DataBlockClass = interface(JObjectClass)
    ['{B37F525A-D184-49FE-AC67-4B84CE2DAAB4}']
    { class }
    function getDataBlocks(b: TJavaArray<Byte>; version: Jqrcode_decoder_Version; errorCorrectionLevel: JErrorCorrectionLevel): TJavaObjectArray<Jdecoder_DataBlock>; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataBlock')]
  Jdecoder_DataBlock = interface(JObject)
    ['{334248FD-F7A0-4B3B-8056-29F113DDF2DB}']
    function getNumDataCodewords: Integer; cdecl;
  end;

  TJdecoder_DataBlock = class(TJavaGenericImport<Jdecoder_DataBlockClass, Jdecoder_DataBlock>)
  end;

  JDataMaskClass = interface(JEnumClass)
    ['{31791168-651A-461F-A434-A34F12BD3E96}']
    { class }
    function _GetDATA_MASK_000: JDataMask; cdecl;
    { class }     function _GetDATA_MASK_001: JDataMask; cdecl;
    { class }     function _GetDATA_MASK_010: JDataMask; cdecl;
    { class }     function _GetDATA_MASK_011: JDataMask; cdecl;
    { class }     function _GetDATA_MASK_100: JDataMask; cdecl;
    { class }     function _GetDATA_MASK_101: JDataMask; cdecl;
    { class }     function _GetDATA_MASK_110: JDataMask; cdecl;
    { class }     function _GetDATA_MASK_111: JDataMask; cdecl;
    { class }     function valueOf(string_: JString): JDataMask; cdecl;
    { class }     function values: TJavaObjectArray<JDataMask>; cdecl; // Deprecated
    { class }
    property DATA_MASK_000: JDataMask read _GetDATA_MASK_000;
    { class }     property DATA_MASK_001: JDataMask read _GetDATA_MASK_001;
    { class }     property DATA_MASK_010: JDataMask read _GetDATA_MASK_010;
    { class }     property DATA_MASK_011: JDataMask read _GetDATA_MASK_011;
    { class }     property DATA_MASK_100: JDataMask read _GetDATA_MASK_100;
    { class }     property DATA_MASK_101: JDataMask read _GetDATA_MASK_101;
    { class }     property DATA_MASK_110: JDataMask read _GetDATA_MASK_110;
    { class }     property DATA_MASK_111: JDataMask read _GetDATA_MASK_111;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask')]
  JDataMask = interface(JEnum)
    ['{85EA3CBA-7232-42C1-B1FE-86573270F11B}']
  end;

  TJDataMask = class(TJavaGenericImport<JDataMaskClass, JDataMask>)
  end;

  JDataMask_1Class = interface(JDataMaskClass)
    ['{5B31737E-A6E7-4E0A-9480-9C4E22CF133C}']
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$1')]
  JDataMask_1 = interface(JDataMask)
    ['{E3C0C27C-8A92-4D04-916F-E2BB3B0B93B1}']
    function isMasked(i: Integer; i1: Integer): Boolean; cdecl;
  end;

  TJDataMask_1 = class(TJavaGenericImport<JDataMask_1Class, JDataMask_1>)
  end;

  JDataMask_2Class = interface(JDataMaskClass)
    ['{57800CEF-BA60-4CED-AC1D-2368213FF99C}']
    { class }
    function init(string_: JString; i: Integer): JDataMask_2; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$2')]
  JDataMask_2 = interface(JDataMask)
    ['{D666CE30-3AB7-4AF7-80A8-91F8A04D3D69}']
    function isMasked(i: Integer; i1: Integer): Boolean; cdecl;
  end;

  TJDataMask_2 = class(TJavaGenericImport<JDataMask_2Class, JDataMask_2>)
  end;

  JDataMask_3Class = interface(JDataMaskClass)
    ['{016C37CC-7B48-4FC9-BE27-E4FBB43EE04B}']
    { class }
    function init(string_: JString; i: Integer): JDataMask_3; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$3')]
  JDataMask_3 = interface(JDataMask)
    ['{730DB81A-BA4D-4CA5-A99E-33EC482A08A7}']
    function isMasked(i: Integer; i1: Integer): Boolean; cdecl;
  end;

  TJDataMask_3 = class(TJavaGenericImport<JDataMask_3Class, JDataMask_3>)
  end;

  JDataMask_4Class = interface(JDataMaskClass)
    ['{9AFFDAA0-BFA0-47C6-B7B1-42C7D39964CD}']
    { class }
    function init(string_: JString; i: Integer): JDataMask_4; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$4')]
  JDataMask_4 = interface(JDataMask)
    ['{6F628C8C-1BBE-4A87-B7CA-089972523CB9}']
    function isMasked(i: Integer; i1: Integer): Boolean; cdecl;
  end;

  TJDataMask_4 = class(TJavaGenericImport<JDataMask_4Class, JDataMask_4>)
  end;

  JDataMask_5Class = interface(JDataMaskClass)
    ['{DE450344-0A1B-43D8-AED6-1D6BCB621C6B}']
    { class }
    function init(string_: JString; i: Integer): JDataMask_5; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$5')]
  JDataMask_5 = interface(JDataMask)
    ['{5B01840E-A3F5-430D-A24C-AA00E764E967}']
    function isMasked(i: Integer; i1: Integer): Boolean; cdecl;
  end;

  TJDataMask_5 = class(TJavaGenericImport<JDataMask_5Class, JDataMask_5>)
  end;

  JDataMask_6Class = interface(JDataMaskClass)
    ['{C9096C4F-2AAF-4B22-B552-C8787F399C62}']
    { class }
    function init(string_: JString; i: Integer): JDataMask_6; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$6')]
  JDataMask_6 = interface(JDataMask)
    ['{D4054BD1-D7B9-4809-B073-7F49B6431887}']
    function isMasked(i: Integer; i1: Integer): Boolean; cdecl;
  end;

  TJDataMask_6 = class(TJavaGenericImport<JDataMask_6Class, JDataMask_6>)
  end;

  JDataMask_7Class = interface(JDataMaskClass)
    ['{0EFED456-6480-4B5E-976F-1C78C9C84486}']
    { class }
    function init(string_: JString; i: Integer): JDataMask_7; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$7')]
  JDataMask_7 = interface(JDataMask)
    ['{4B7E9C0D-40AD-43CE-9F9B-124FEA84830A}']
    function isMasked(i: Integer; i1: Integer): Boolean; cdecl;
  end;

  TJDataMask_7 = class(TJavaGenericImport<JDataMask_7Class, JDataMask_7>)
  end;

  JDataMask_8Class = interface(JDataMaskClass)
    ['{65F17E98-1293-4ABB-990C-2DCAA96CA087}']
    { class }
    function init(string_: JString; i: Integer): JDataMask_8; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$8')]
  JDataMask_8 = interface(JDataMask)
    ['{2340F12F-B24C-4974-88A4-FD0783A986B5}']
    function isMasked(i: Integer; i1: Integer): Boolean; cdecl;
  end;

  TJDataMask_8 = class(TJavaGenericImport<JDataMask_8Class, JDataMask_8>)
  end;

  Jqrcode_decoder_DecodedBitStreamParserClass = interface(JObjectClass)
    ['{B2C34668-8262-4807-AD49-C488AEA9EE32}']
    { class }
    function decode(b: TJavaArray<Byte>; version: Jqrcode_decoder_Version; errorCorrectionLevel: JErrorCorrectionLevel; map: JMap): JDecoderResult; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DecodedBitStreamParser')]
  Jqrcode_decoder_DecodedBitStreamParser = interface(JObject)
    ['{85EE994C-0A76-4B84-8432-2DD922187F19}']
  end;

  TJqrcode_decoder_DecodedBitStreamParser = class(TJavaGenericImport<Jqrcode_decoder_DecodedBitStreamParserClass, Jqrcode_decoder_DecodedBitStreamParser>)
  end;

  { Rever }
  Jqrcode_decoder_DecodedBitStreamParser_1Class = interface(JObjectClass)
    ['{072B49FE-B8AA-4137-8B61-3006DD99DF5D}']
    { class }
    function _GetSwitchMapComgooglezxingqrcodeDECoderMode: TJavaArray<Integer>; cdecl;
    { class }     property SwitchMapComgooglezxingqrcodeDECoderMode: TJavaArray<Integer> read _GetSwitchMapComgooglezxingqrcodeDECoderMode;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DecodedBitStreamParser$1')]
  Jqrcode_decoder_DecodedBitStreamParser_1 = interface(JObject)
    ['{8A7A2D8A-CDAC-4D49-8E8B-217B8F9DE3D1}']
  end;

  TJqrcode_decoder_DecodedBitStreamParser_1 = class(TJavaGenericImport<Jqrcode_decoder_DecodedBitStreamParser_1Class, Jqrcode_decoder_DecodedBitStreamParser_1>)
  end;

  Jqrcode_decoder_DecoderClass = interface(JObjectClass)
    ['{1D1E11BA-D47F-431C-97F4-25D9DDA07ED4}']
    { class }
    function init: Jqrcode_decoder_Decoder; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/Decoder')]
  Jqrcode_decoder_Decoder = interface(JObject)
    ['{331302A1-C67D-4216-AAD8-EA6749954C6D}']
    function decode(bitMatrix: JBitMatrix): JDecoderResult; cdecl; overload;
    function decode(b: TJavaBiArray<Boolean>): JDecoderResult; cdecl; overload;
    function decode(bitMatrix: JBitMatrix; map: JMap): JDecoderResult; cdecl; overload;
    function decode(b: TJavaBiArray<Boolean>; map: JMap): JDecoderResult; cdecl; overload;
  end;

  TJqrcode_decoder_Decoder = class(TJavaGenericImport<Jqrcode_decoder_DecoderClass, Jqrcode_decoder_Decoder>)
  end;

  JErrorCorrectionLevelClass = interface(JEnumClass)
    ['{BB344DF6-1BC5-4E2A-A768-A35B1CB82CBE}']
    { class }
    function _GetH: JErrorCorrectionLevel; cdecl;
    { class }     function _GetL: JErrorCorrectionLevel; cdecl;
    { class }     function _GetM: JErrorCorrectionLevel; cdecl;
    { class }     function _GetQ: JErrorCorrectionLevel; cdecl;
    { class }     function forBits(i: Integer): JErrorCorrectionLevel; cdecl;
    { class }     function valueOf(string_: JString): JErrorCorrectionLevel; cdecl;
    { class }     function values: TJavaObjectArray<JErrorCorrectionLevel>; cdecl;
    // Deprecated
    { class }     property H: JErrorCorrectionLevel read _GetH;
    { class }     property l: JErrorCorrectionLevel read _GetL;
    { class }     property M: JErrorCorrectionLevel read _GetM;
    { class }     property Q: JErrorCorrectionLevel read _GetQ;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/ErrorCorrectionLevel')]
  JErrorCorrectionLevel = interface(JEnum)
    ['{FCFF360C-8528-4241-86F3-CF9D0A4564C4}']
    function getBits: Integer; cdecl;
  end;

  TJErrorCorrectionLevel = class(TJavaGenericImport<JErrorCorrectionLevelClass, JErrorCorrectionLevel>)
  end;

  JFormatInformationClass = interface(JObjectClass)
    ['{FA7F3CA8-B03D-4DD6-A78C-216B15A8551E}']
    { class }
    function decodeFormatInformation(i: Integer; i1: Integer): JFormatInformation; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/FormatInformation')]
  JFormatInformation = interface(JObject)
    ['{952BB022-4CAC-476C-A40B-1DBB9B1BB3E8}']
    function equals(object_: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
  end;

  TJFormatInformation = class(TJavaGenericImport<JFormatInformationClass, JFormatInformation>)
  end;

  JModeClass = interface(JEnumClass)
    ['{D6FA9187-3F1F-4DAC-93A9-D44162E13ADD}']
    { class }
    function _GetALPHANUMERIC: JMode; cdecl;
    { class }     function _GetBYTE: JMode; cdecl;
    { class }     function _GetECI: JMode; cdecl;
    { class }     function _GetFNC1_FIRST_POSITION: JMode; cdecl;
    { class }     function _GetFNC1_SECOND_POSITION: JMode; cdecl;
    { class }     function _GetHANZI: JMode; cdecl;
    { class }     function _GetKANJI: JMode; cdecl;
    { class }     function _GetNUMERIC: JMode; cdecl;
    { class }     function _GetSTRUCTURED_APPEND: JMode; cdecl;
    { class }     function _GetTERMINATOR: JMode; cdecl;
    { class }     function forBits(i: Integer): JMode; cdecl;
    { class }     function valueOf(string_: JString): JMode; cdecl;
    { class }     function values: TJavaObjectArray<JMode>; cdecl; // Deprecated
    { class }
    property ALPHANUMERIC: JMode read _GetALPHANUMERIC;
    { class }     property Byte: JMode read _GetBYTE;
    { class }     property ECI: JMode read _GetECI;
    { class }     property FNC1_FIRST_POSITION: JMode read _GetFNC1_FIRST_POSITION;
    { class }     property FNC1_SECOND_POSITION: JMode read _GetFNC1_SECOND_POSITION;
    { class }     property HANZI: JMode read _GetHANZI;
    { class }     property KANJI: JMode read _GetKANJI;
    { class }     property NUMERIC: JMode read _GetNUMERIC;
    { class }     property STRUCTURED_APPEND: JMode read _GetSTRUCTURED_APPEND;
    { class }     property TERMINATOR: JMode read _GetTERMINATOR;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/Mode')]
  JMode = interface(JEnum)
    ['{92CD784B-AF39-4330-AE1C-AF9A98B0B6D9}']
    function getBits: Integer; cdecl;
    function getCharacterCountBits(version: Jqrcode_decoder_Version): Integer; cdecl;
  end;

  TJMode = class(TJavaGenericImport<JModeClass, JMode>)
  end;

  JQRCodeDecoderMetaDataClass = interface(JObjectClass)
    ['{BDF8CE61-FD60-4487-8385-DB51FE008CE0}']
    { class }
    function init(b: Boolean): JQRCodeDecoderMetaData; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/QRCodeDecoderMetaData')]
  JQRCodeDecoderMetaData = interface(JObject)
    ['{CAF95004-65FE-43D1-9A1C-1E87D8B996CD}']
    procedure applyMirroredCorrection(resultPoint: TJavaObjectArray<JResultPoint>); cdecl;
    function isMirrored: Boolean; cdecl;
  end;

  TJQRCodeDecoderMetaData = class(TJavaGenericImport<JQRCodeDecoderMetaDataClass, JQRCodeDecoderMetaData>)
  end;

  Jqrcode_decoder_VersionClass = interface(JObjectClass)
    ['{75412CF0-6C6B-4957-AD63-7B4FBF884EA7}']
    { class }
    function getProvisionalVersionForDimension(i: Integer): Jqrcode_decoder_Version; cdecl;
    { class }     function getVersionForNumber(i: Integer): Jqrcode_decoder_Version; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/Version')]
  Jqrcode_decoder_Version = interface(JObject)
    ['{81B773B9-E67B-4B5E-806F-D04AACD02922}']
    function getAlignmentPatternCenters: TJavaArray<Integer>; cdecl;
    function getDimensionForVersion: Integer; cdecl;
    function getECBlocksForLevel(errorCorrectionLevel: JErrorCorrectionLevel): Jdecoder_Version_ECBlocks; cdecl;
    function getTotalCodewords: Integer; cdecl;
    function getVersionNumber: Integer; cdecl;
    function toString: JString; cdecl;
  end;

  TJqrcode_decoder_Version = class(TJavaGenericImport<Jqrcode_decoder_VersionClass, Jqrcode_decoder_Version>)
  end;

  Jdecoder_Version_ECBClass = interface(JObjectClass)
    ['{705D2E52-0B09-45C4-9ECB-3B19A2959007}']
    { class }
    function init(i: Integer; i1: Integer): Jdecoder_Version_ECB; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/Version$ECB')]
  Jdecoder_Version_ECB = interface(JObject)
    ['{8078C80B-EE9B-4250-9AAE-ED9A1A8D508A}']
    function getCount: Integer; cdecl;
    function getDataCodewords: Integer; cdecl;
  end;

  TJdecoder_Version_ECB = class(TJavaGenericImport<Jdecoder_Version_ECBClass, Jdecoder_Version_ECB>)
  end;

  Jdecoder_Version_ECBlocksClass = interface(JObjectClass)
    ['{CB204D41-86ED-4C55-9FAE-930588979A79}']
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/Version$ECBlocks')]
  Jdecoder_Version_ECBlocks = interface(JObject)
    ['{52ED139F-6CD5-4B49-964D-A3AE3DBE12A8}']
    function getECBlocks: TJavaObjectArray<Jdecoder_Version_ECB>; cdecl;
    function getECCodewordsPerBlock: Integer; cdecl;
    function getNumBlocks: Integer; cdecl;
    function getTotalECCodewords: Integer; cdecl;
  end;

  TJdecoder_Version_ECBlocks = class(TJavaGenericImport<Jdecoder_Version_ECBlocksClass, Jdecoder_Version_ECBlocks>)
  end;

  JAlignmentPatternClass = interface(JResultPointClass)
    ['{B5160D2B-A250-4AAF-9F49-6DB0D3C78CBD}']
    { class }
    function init(f: Single; f1: Single; f2: Single): JAlignmentPattern; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/AlignmentPattern')]
  JAlignmentPattern = interface(JResultPoint)
    ['{097DCA94-16DB-4963-9740-1AE32FB83175}']
    function aboutEquals(f: Single; f1: Single; f2: Single): Boolean; cdecl;
  end;

  TJAlignmentPattern = class(TJavaGenericImport<JAlignmentPatternClass, JAlignmentPattern>)
  end;

  JAlignmentPatternFinderClass = interface(JObjectClass)
    ['{53776C1C-77DA-43B2-8533-8236097D3413}']
    { class }
    function init(bitMatrix: JBitMatrix; i: Integer; i1: Integer; i2: Integer; i3: Integer; f: Single; resultPointCallback: JResultPointCallback): JAlignmentPatternFinder; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/AlignmentPatternFinder')]
  JAlignmentPatternFinder = interface(JObject)
    ['{2A486A76-34A2-4DEA-BDD1-A3B7EE107761}']
    function find: JAlignmentPattern; cdecl;
  end;

  TJAlignmentPatternFinder = class(TJavaGenericImport<JAlignmentPatternFinderClass, JAlignmentPatternFinder>)
  end;

  JFinderPatternClass = interface(JResultPointClass)
    ['{635B79AC-4158-4BD9-BA8A-9032CFA0D7C0}']
    { class }
    function init(f: Single; f1: Single; f2: Single): JFinderPattern; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/FinderPattern')]
  JFinderPattern = interface(JResultPoint)
    ['{09DE01D2-B4BE-407E-B099-61C1E5DC1499}']
    function getCount: Integer; cdecl;
    function getEstimatedModuleSize: Single; cdecl;
  end;

  TJFinderPattern = class(TJavaGenericImport<JFinderPatternClass, JFinderPattern>)
  end;

  JFinderPatternFinder_1Class = interface(JObjectClass)
    ['{19D23603-FB9F-495F-8A21-CC91162C7DFF}']
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/FinderPatternFinder$1')]
  JFinderPatternFinder_1 = interface(JObject)
    ['{1D6DE451-BABF-423A-9894-908468238CF9}']
  end;

  TJFinderPatternFinder_1 = class(TJavaGenericImport<JFinderPatternFinder_1Class, JFinderPatternFinder_1>)
  end;

  JFinderPatternFinder_EstimatedModuleComparatorClass = interface(JComparatorClass)
    ['{799269D1-29AB-4833-A736-CB41ABF49EA2}']
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/FinderPatternFinder$EstimatedModuleComparator')]
  JFinderPatternFinder_EstimatedModuleComparator = interface(JComparator)
    ['{173BA0E8-4C9A-4342-839D-77A7408644D7}']
    function compare(object_: JObject; object_1: JObject): Integer; cdecl; overload;
    function compare(finderPattern: JFinderPattern; finderPattern1: JFinderPattern): Integer; cdecl; overload;
  end;

  TJFinderPatternFinder_EstimatedModuleComparator = class(TJavaGenericImport<JFinderPatternFinder_EstimatedModuleComparatorClass, JFinderPatternFinder_EstimatedModuleComparator>)
  end;

  JFinderPatternInfoClass = interface(JObjectClass)
    ['{67AFC210-C99E-4910-81A6-901E7F11F153}']
    { class }
    function init(finderPattern: TJavaObjectArray<JFinderPattern>): JFinderPatternInfo; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/FinderPatternInfo')]
  JFinderPatternInfo = interface(JObject)
    ['{571FD51A-893D-4AD1-B299-019BA3BE465E}']
    function getBottomLeft: JFinderPattern; cdecl;
    function getTopLeft: JFinderPattern; cdecl;
    function getTopRight: JFinderPattern; cdecl;
  end;

  TJFinderPatternInfo = class(TJavaGenericImport<JFinderPatternInfoClass, JFinderPatternInfo>)
  end;

  JBlockPairClass = interface(JObjectClass)
    ['{6151F808-1395-458C-AE19-1AAF8F63F70B}']
    { class }
    function init(b: TJavaArray<Byte>; b1: TJavaArray<Byte>): JBlockPair; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/BlockPair')]
  JBlockPair = interface(JObject)
    ['{71AD39EB-DE70-4B00-8057-ECEA25B24290}']
    function getDataBytes: TJavaArray<Byte>; cdecl;
    function getErrorCorrectionBytes: TJavaArray<Byte>; cdecl;
  end;

  TJBlockPair = class(TJavaGenericImport<JBlockPairClass, JBlockPair>)
  end;

  JByteMatrixClass = interface(JObjectClass)
    ['{156AEBDA-06AD-4E5C-B793-9AB91D415AF4}']
    { class }
    function init(i: Integer; i1: Integer): JByteMatrix; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/ByteMatrix')]
  JByteMatrix = interface(JObject)
    ['{2159FF2C-FE66-478C-890F-FDDD8FA514FE}']
    procedure clear(b: Byte); cdecl;
    function &get(i: Integer; i1: Integer): Byte; cdecl;
    function getArray: TJavaBiArray<Byte>; cdecl;
    function getHeight: Integer; cdecl;
    function getWidth: Integer; cdecl;
    procedure &set(i: Integer; i1: Integer; b: Boolean); cdecl; overload;
    procedure &set(i: Integer; i1: Integer; b: Byte); cdecl; overload;
    procedure &set(i: Integer; i1: Integer; i2: Integer); cdecl; overload;
    function toString: JString; cdecl;
  end;

  TJByteMatrix = class(TJavaGenericImport<JByteMatrixClass, JByteMatrix>)
  end;

  Jqrcode_encoder_EncoderClass = interface(JObjectClass)
    ['{8A252C21-70F3-40B5-8E99-B2FCABA87634}']
    { class }
    function _GetDEFAULT_BYTE_MODE_ENCODING: JCharset; cdecl;
    { class }     procedure appendNumericBytes(charSequence: JCharSequence; bitArray: JBitArray); cdecl;
    { class }     function chooseMode(string_: JString): JMode; cdecl;
    { class }     function encode(string_: JString; errorCorrectionLevel: JErrorCorrectionLevel): JQRCode; cdecl; overload;
    { class }     function encode(string_: JString; errorCorrectionLevel: JErrorCorrectionLevel; map: JMap): JQRCode; cdecl; overload;
    { class }     function generateECBytes(b: TJavaArray<Byte>; i: Integer): TJavaArray<Byte>; cdecl;
    { class }     function willFit(i: Integer; version: Jqrcode_decoder_Version; errorCorrectionLevel: JErrorCorrectionLevel): Boolean; cdecl;
    { class }     property DEFAULT_BYTE_MODE_ENCODING: JCharset read _GetDEFAULT_BYTE_MODE_ENCODING;
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/Encoder')]
  Jqrcode_encoder_Encoder = interface(JObject)
    ['{7C1D5A4B-6315-4182-B2DF-ED9B666A6A30}']
  end;

  TJqrcode_encoder_Encoder = class(TJavaGenericImport<Jqrcode_encoder_EncoderClass, Jqrcode_encoder_Encoder>)
  end;

  { Rever }
  JEncoder_1Class = interface(JObjectClass)
    ['{43CCBFD0-DA29-4579-9DBC-1CA8D5B2FC43}']
    { class }
    function _GetSwitchMapComgooglezxingqrcodeDECoderMode: TJavaArray<Integer>; cdecl;
    { class }     property SwitchMapComgooglezxingqrcodeDECoderMode: TJavaArray<Integer> read _GetSwitchMapComgooglezxingqrcodeDECoderMode;
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/Encoder$1')]
  JEncoder_1 = interface(JObject)
    ['{44DFA5DF-1F3A-4CEC-962F-24B49CC6987E}']
  end;

  TJEncoder_1 = class(TJavaGenericImport<JEncoder_1Class, JEncoder_1>)
  end;

  JMaskUtilClass = interface(JObjectClass)
    ['{C0DDD06B-5289-41BC-9E0D-E3561392796B}']
    { class }
    function applyMaskPenaltyRule1(byteMatrix: JByteMatrix): Integer; cdecl;
    { class }     function applyMaskPenaltyRule2(byteMatrix: JByteMatrix): Integer; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/MaskUtil')]
  JMaskUtil = interface(JObject)
    ['{8104494A-0511-4A08-AF79-179A5B9ACAD4}']
  end;

  TJMaskUtil = class(TJavaGenericImport<JMaskUtilClass, JMaskUtil>)
  end;

  JMatrixUtilClass = interface(JObjectClass)
    ['{C345C540-1AA9-4864-8247-947374A722D9}']
    { class }
    procedure buildMatrix(bitArray: JBitArray; errorCorrectionLevel: JErrorCorrectionLevel; version: Jqrcode_decoder_Version; i: Integer; byteMatrix: JByteMatrix); cdecl;
    { class }     procedure clearMatrix(byteMatrix: JByteMatrix); cdecl;
    { class }     procedure embedDataBits(bitArray: JBitArray; i: Integer; byteMatrix: JByteMatrix); cdecl;
    { class }     procedure makeVersionInfoBits(version: Jqrcode_decoder_Version; bitArray: JBitArray); cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/MatrixUtil')]
  JMatrixUtil = interface(JObject)
    ['{9C4F78A8-8913-40E9-910F-38CE50305F01}']
  end;

  TJMatrixUtil = class(TJavaGenericImport<JMatrixUtilClass, JMatrixUtil>)
  end;

  Jencoder_MinimalEncoderClass = interface(JObjectClass)
    ['{876A5057-CBCC-4576-8CB0-5A1C1463B59A}']
    { class }
    function encode(string_: JString; version: Jqrcode_decoder_Version; charset: JCharset; b: Boolean; errorCorrectionLevel: JErrorCorrectionLevel): JMinimalEncoder_ResultList; cdecl; overload;
    { class }     function getCompactedOrdinal(Mode: JMode): Integer; cdecl;
    { class }     function isNumeric(c: Char): Boolean; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/MinimalEncoder')]
  Jencoder_MinimalEncoder = interface(JObject)
    ['{F50E0578-8495-45A8-ACE6-F988BD54F7B1}']
  end;

  TJencoder_MinimalEncoder = class(TJavaGenericImport<Jencoder_MinimalEncoderClass, Jencoder_MinimalEncoder>)
  end;

  { Rever }
  Jencoder_MinimalEncoder_1Class = interface(JObjectClass)
    ['{31F1F2F9-D633-4740-BA01-B082CC2C17AA}']
    { class }
    function _GetSwitchMapComgooglezxingqrcodeDECoderMode: TJavaArray<Integer>; cdecl;
    { class }     function _GetSwitchMapComgooglezxingqrcodeEncoderMinimalEncoderVersionSize: TJavaArray<Integer>; cdecl;
    { class }     property SwitchMapComgooglezxingqrcodeDECoderMode: TJavaArray<Integer> read _GetSwitchMapComgooglezxingqrcodeDECoderMode;
    { class }     property SwitchMapComgooglezxingqrcodeEncoderMinimalEncoderVersionSize: TJavaArray<Integer> read _GetSwitchMapComgooglezxingqrcodeEncoderMinimalEncoderVersionSize;
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/MinimalEncoder$1')]
  Jencoder_MinimalEncoder_1 = interface(JObject)
    ['{39231771-D901-4FBA-A6DD-789DE1EB10EF}']
  end;

  TJencoder_MinimalEncoder_1 = class(TJavaGenericImport<Jencoder_MinimalEncoder_1Class, Jencoder_MinimalEncoder_1>)
  end;

  Jencoder_MinimalEncoder_EdgeClass = interface(JObjectClass)
    ['{81398752-6878-4FDF-94B0-BF2071324739}']
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/MinimalEncoder$Edge')]
  Jencoder_MinimalEncoder_Edge = interface(JObject)
    ['{BFCE2122-DE3E-4CB9-A4D6-9F4DA15E0B62}']
    function _Getthis: Jencoder_MinimalEncoder; cdecl;
    property this: Jencoder_MinimalEncoder read _Getthis;
  end;

  TJencoder_MinimalEncoder_Edge = class(TJavaGenericImport<Jencoder_MinimalEncoder_EdgeClass, Jencoder_MinimalEncoder_Edge>)
  end;

  JMinimalEncoder_ResultListClass = interface(JObjectClass)
    ['{349594AE-1C75-4390-B6B6-E6E98226E549}']
    { class }
    function init(MinimalEncoder: Jencoder_MinimalEncoder; version: Jqrcode_decoder_Version; edge: Jencoder_MinimalEncoder_Edge): JMinimalEncoder_ResultList; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/MinimalEncoder$ResultList')]
  JMinimalEncoder_ResultList = interface(JObject)
    ['{43D67E70-3781-4EBC-8AD6-536A48CDF1B4}']
    function getSize: Integer; cdecl;
    function toString: JString; cdecl;
  end;

  TJMinimalEncoder_ResultList = class(TJavaGenericImport<JMinimalEncoder_ResultListClass, JMinimalEncoder_ResultList>)
  end;

  JResultList_ResultNodeClass = interface(JObjectClass)
    ['{5E59964F-F1EC-4CD2-B258-3B768CE92DD7}']
    { class }
    function init(resultList: JMinimalEncoder_ResultList; Mode: JMode; i: Integer; i1: Integer; i2: Integer): JResultList_ResultNode; cdecl;
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/MinimalEncoder$ResultList$ResultNode')]
  JResultList_ResultNode = interface(JObject)
    ['{31F4F992-DC9F-4097-8986-35640D7358DE}']
    function _Getthis: JMinimalEncoder_ResultList; cdecl;
    function toString: JString; cdecl;
    property this: JMinimalEncoder_ResultList read _Getthis;
  end;

  TJResultList_ResultNode = class(TJavaGenericImport<JResultList_ResultNodeClass, JResultList_ResultNode>)
  end;

  JMinimalEncoder_VersionSizeClass = interface(JEnumClass)
    ['{9564F0EE-5318-4209-91AD-838F32855101}']
    { class }
    function _GetLARGE: JMinimalEncoder_VersionSize; cdecl;
    { class }     function _GetMEDIUM: JMinimalEncoder_VersionSize; cdecl;
    { class }     function _GetSMALL: JMinimalEncoder_VersionSize; cdecl;
    { class }     function valueOf(string_: JString): JMinimalEncoder_VersionSize; cdecl;
    { class }     function values: TJavaObjectArray<JMinimalEncoder_VersionSize>; cdecl; // Deprecated
    { class }
    property LARGE: JMinimalEncoder_VersionSize read _GetLARGE;
    { class }     property MEDIUM: JMinimalEncoder_VersionSize read _GetMEDIUM;
    { class }     property SMALL: JMinimalEncoder_VersionSize read _GetSMALL;
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/MinimalEncoder$VersionSize')]
  JMinimalEncoder_VersionSize = interface(JEnum)
    ['{51ED79CE-0A0D-48BA-BAF1-17BE48A53CEF}']
    function toString: JString; cdecl;
  end;

  TJMinimalEncoder_VersionSize = class(TJavaGenericImport<JMinimalEncoder_VersionSizeClass, JMinimalEncoder_VersionSize>)
  end;

  JQRCodeClass = interface(JObjectClass)
    ['{7444B87C-96C0-4201-8470-36EA315A787B}']
    { class }
    function _GetNUM_MASK_PATTERNS: Integer; cdecl;
    { class }     function init: JQRCode; cdecl;
    { class }     function isValidMaskPattern(i: Integer): Boolean; cdecl;
    { class }     property NUM_MASK_PATTERNS: Integer read _GetNUM_MASK_PATTERNS;
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/QRCode')]
  JQRCode = interface(JObject)
    ['{0731E1A6-C4EC-42C8-882F-FDAC1B506BFE}']
    function getECLevel: JErrorCorrectionLevel; cdecl;
    function getMaskPattern: Integer; cdecl;
    function getMatrix: JByteMatrix; cdecl;
    function getMode: JMode; cdecl;
    function getVersion: Jqrcode_decoder_Version; cdecl;
    procedure setECLevel(errorCorrectionLevel: JErrorCorrectionLevel); cdecl;
    procedure setMaskPattern(i: Integer); cdecl;
    procedure setMatrix(byteMatrix: JByteMatrix); cdecl;
    procedure setMode(Mode: JMode); cdecl;
    procedure setVersion(version: Jqrcode_decoder_Version); cdecl;
    function toString: JString; cdecl;
  end;

  TJQRCode = class(TJavaGenericImport<JQRCodeClass, JQRCode>)
  end;

  JIPrinterCallbackClass = interface(JIInterfaceClass)
    ['{C71BF87E-51C1-45C1-BA4D-B90B7EC71BB3}']
  end;

  [JavaSignature('com/prints/printerservice/IPrinterCallback')]
  JIPrinterCallback = interface(JIInterface)
    ['{751BC69C-86E1-473D-AE8D-54068541AE2C}']
    procedure onComplete; cdecl;
    procedure onException(i: Integer; string_: JString); cdecl;
    procedure onLength(l: Int64; l1: Int64); cdecl;
    procedure onStart; cdecl;
  end;

  TJIPrinterCallback = class(TJavaGenericImport<JIPrinterCallbackClass, JIPrinterCallback>)
  end;

  JIPrinterCallback_Stub_ProxyClass = interface(JIPrinterCallbackClass)
    ['{5131F306-9F9D-4319-A661-1813C437045A}']
  end;

  [JavaSignature('com/prints/printerservice/IPrinterCallback$Stub$Proxy')]
  JIPrinterCallback_Stub_Proxy = interface(JIPrinterCallback)
    ['{545EECA2-EC67-4DCC-A4C6-25E9A4967D1B}']
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onComplete; cdecl;
    procedure onException(i: Integer; string_: JString); cdecl;
    procedure onLength(l: Int64; l1: Int64); cdecl;
    procedure onStart; cdecl;
  end;

  TJIPrinterCallback_Stub_Proxy = class(TJavaGenericImport<JIPrinterCallback_Stub_ProxyClass, JIPrinterCallback_Stub_Proxy>)
  end;

  JIPrinterServiceClass = interface(JIInterfaceClass)
    ['{F518BEFC-B839-4608-A9F9-E05B438BCA7A}']
  end;

  [JavaSignature('com/prints/printerservice/IPrinterService')]
  JIPrinterService = interface(JIInterface)
    ['{91480FC3-5A8C-4FB5-AE20-E7A3E51778FC}']
    function getBootloaderVersion: JString; cdecl;
    function getFirmwareVersion: JString; cdecl;
    function getRAWDataRet(b: TJavaArray<Byte>; iPrinterCallback: JIPrinterCallback): Integer; cdecl;
    procedure printBarCode(string_: JString; i: Integer; i1: Integer; i2: Integer; b: Boolean; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printBarCodeWithPos(string_: JString; i: Integer; i1: Integer; i2: Integer; i3: Integer; i4: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printBitmap(bitmap: JBitmap; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printBitmapWidth(bitmap: JBitmap; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printBitmapWithAttributes(bitmap: JBitmap; map: JMap; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printColumnsString(string_: TJavaObjectArray<JString>; i: TJavaArray<Integer>; i1: TJavaArray<Integer>; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printColumnsTextWithAttributes(string_: TJavaObjectArray<JString>; list: JList; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printQRCode(string_: JString; i: Integer; i1: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printQRCodeWithErr(string_: JString; i: Integer; i1: Integer; i2: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printStart(iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printText(string_: JString; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printTextWithAttributes(string_: JString; map: JMap; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printTextWithFont(string_: JString; i: Integer; i1: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printWrapPaper(i: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    function printerHSStart(iPrinterCallback: JIPrinterCallback): Integer; cdecl;
    procedure printerInit(iPrinterCallback: JIPrinterCallback); cdecl;
    function printerPaper(iPrinterCallback: JIPrinterCallback): Boolean; cdecl;
    procedure printerReset(iPrinterCallback: JIPrinterCallback); cdecl;
    function printerTemperature(iPrinterCallback: JIPrinterCallback): Integer; cdecl;
    procedure sendPackageData(b: TJavaArray<Byte>); cdecl;
    procedure sendRawData(b: TJavaArray<Byte>; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure setAlignment(i: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure setDefaultPrintEncode(iPrinterCallback: JIPrinterCallback); cdecl;
    procedure setFontSize(i: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure setPrintEncode(string_: JString; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure setPrinterSpeed(i: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure setPrinterStyle(string_: JString; i: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    function updatePrinterState(iPrinterCallback: JIPrinterCallback): Integer; cdecl;
    procedure upgradePrinter; cdecl;
  end;

  TJIPrinterService = class(TJavaGenericImport<JIPrinterServiceClass, JIPrinterService>)
  end;

  JIPrinterService_StubClass = interface(JBinderClass)
    ['{EF9474C9-6931-4621-95FA-CC8F67FBCB86}']
    { class }
    function _GetTRANSACTION_getFirmwareVersion: Integer; cdecl;
    { class }     function _GetTRANSACTION_printBarCode: Integer; cdecl;
    { class }     function _GetTRANSACTION_printColumnsTextWithAttributes: Integer; cdecl;
    { class }     function _GetTRANSACTION_printWrapPaper: Integer; cdecl;
    { class }     function _GetTRANSACTION_updatePrinterState: Integer; cdecl;
    { class }     function asInterface(iBinder: JIBinder): JIPrinterService; cdecl;
    { class }     function init: JIPrinterService_Stub; cdecl; // Deprecated
    { class }
    property TRANSACTION_getFirmwareVersion: Integer read _GetTRANSACTION_getFirmwareVersion;
    { class }     property TRANSACTION_printBarCode: Integer read _GetTRANSACTION_printBarCode;
    { class }     property TRANSACTION_printColumnsTextWithAttributes: Integer read _GetTRANSACTION_printColumnsTextWithAttributes;
    { class }     property TRANSACTION_printWrapPaper: Integer read _GetTRANSACTION_printWrapPaper;
    { class }     property TRANSACTION_updatePrinterState: Integer read _GetTRANSACTION_updatePrinterState;
  end;

  [JavaSignature('com/prints/printerservice/IPrinterService$Stub')]
  JIPrinterService_Stub = interface(JBinder)
    ['{08360846-26FD-4D6B-93D5-23D5B255777D}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;

  TJIPrinterService_Stub = class(TJavaGenericImport<JIPrinterService_StubClass, JIPrinterService_Stub>)
  end;

  JIPrinterService_Stub_ProxyClass = interface(JIPrinterServiceClass)
    ['{BE82C70C-9C69-4195-8499-B93273768890}']
  end;

  [JavaSignature('com/prints/printerservice/IPrinterService$Stub$Proxy')]
  JIPrinterService_Stub_Proxy = interface(JIPrinterService)
    ['{2BD7E75A-E74B-4DA2-818D-003552C6AE79}']
    function asBinder: JIBinder; cdecl;
    function getBootloaderVersion: JString; cdecl;
    function getFirmwareVersion: JString; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function getRAWDataRet(b: TJavaArray<Byte>; iPrinterCallback: JIPrinterCallback): Integer; cdecl;
    procedure printBarCode(string_: JString; i: Integer; i1: Integer; i2: Integer; b: Boolean; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printBarCodeWithPos(string_: JString; i: Integer; i1: Integer; i2: Integer; i3: Integer; i4: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printBitmap(bitmap: JBitmap; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printBitmapWidth(bitmap: JBitmap; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printBitmapWithAttributes(bitmap: JBitmap; map: JMap; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printColumnsString(string_: TJavaObjectArray<JString>; i: TJavaArray<Integer>; i1: TJavaArray<Integer>; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printColumnsTextWithAttributes(string_: TJavaObjectArray<JString>; list: JList; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printQRCode(string_: JString; i: Integer; i1: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printQRCodeWithErr(string_: JString; i: Integer; i1: Integer; i2: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printStart(iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printText(string_: JString; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printTextWithAttributes(string_: JString; map: JMap; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printTextWithFont(string_: JString; i: Integer; i1: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure printWrapPaper(i: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    function printerHSStart(iPrinterCallback: JIPrinterCallback): Integer; cdecl;
    procedure printerInit(iPrinterCallback: JIPrinterCallback); cdecl;
    function printerPaper(iPrinterCallback: JIPrinterCallback): Boolean; cdecl;
    procedure printerReset(iPrinterCallback: JIPrinterCallback); cdecl;
    function printerTemperature(iPrinterCallback: JIPrinterCallback): Integer; cdecl;
    procedure sendPackageData(b: TJavaArray<Byte>); cdecl;
    procedure sendRawData(b: TJavaArray<Byte>; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure setAlignment(i: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure setDefaultPrintEncode(iPrinterCallback: JIPrinterCallback); cdecl;
    procedure setFontSize(i: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure setPrintEncode(string_: JString; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure setPrinterSpeed(i: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    procedure setPrinterStyle(string_: JString; i: Integer; iPrinterCallback: JIPrinterCallback); cdecl;
    function updatePrinterState(iPrinterCallback: JIPrinterCallback): Integer; cdecl;
    procedure upgradePrinter; cdecl;
  end;

  TJIPrinterService_Stub_Proxy = class(TJavaGenericImport<JIPrinterService_Stub_ProxyClass, JIPrinterService_Stub_Proxy>)
  end;

  JISubLcdCallbackClass = interface(JIInterfaceClass)
    ['{6D104FE5-86D3-4498-9968-A508CD6CA32C}']
  end;

  [JavaSignature('com/xcheng/sublcdservice/ISubLcdCallback')]
  JISubLcdCallback = interface(JIInterface)
    ['{1F67D3DE-C868-4E4C-9C24-8BF1A647B1BB}']
    procedure onReply(b: Byte; i: Integer; string_: JString); cdecl;
  end;

  TJISubLcdCallback = class(TJavaGenericImport<JISubLcdCallbackClass, JISubLcdCallback>)
  end;

  JISubLcdCallback_StubClass = interface(JBinderClass)
    ['{DF76BC6C-474D-42E7-8CA4-3A6A28E5334C}']
    { class }
    function asInterface(iBinder: JIBinder): JISubLcdCallback; cdecl;
    { class }     function init: JISubLcdCallback_Stub; cdecl;
  end;

  [JavaSignature('com/xcheng/sublcdservice/ISubLcdCallback$Stub')]
  JISubLcdCallback_Stub = interface(JBinder)
    ['{F61A6BBB-9D3D-4EB8-A690-F79AF481021E}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;

  TJISubLcdCallback_Stub = class(TJavaGenericImport<JISubLcdCallback_StubClass, JISubLcdCallback_Stub>)
  end;

  JISubLcdCallback_Stub_ProxyClass = interface(JISubLcdCallbackClass)
    ['{1BA5E4A2-6F92-4E10-BC5F-76A4B54BCA09}']
  end;

  [JavaSignature('com/xcheng/sublcdservice/ISubLcdCallback$Stub$Proxy')]
  JISubLcdCallback_Stub_Proxy = interface(JISubLcdCallback)
    ['{F1012EE4-5B50-4B90-A913-6BA4B90B6861}']
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onReply(b: Byte; i: Integer; string_: JString); cdecl;
  end;

  TJISubLcdCallback_Stub_Proxy = class(TJavaGenericImport<JISubLcdCallback_Stub_ProxyClass, JISubLcdCallback_Stub_Proxy>)
  end;

  JISubLcdServiceClass = interface(JIInterfaceClass)
    ['{D1C94D67-DDAF-49C3-A653-61F31D428BD2}']
  end;

  [JavaSignature('com/xcheng/sublcdservice/ISubLcdService')]
  JISubLcdService = interface(JIInterface)
    ['{436F13E3-51DB-4B7F-80A9-2475E9F2802E}']
    function doReadDataPackage(iSubLcdCallback: JISubLcdCallback): Boolean; cdecl;
    function doSendBitmapToSubLcd(bitmap: JBitmap; iSubLcdCallback: JISubLcdCallback): Boolean; cdecl;
    function doSendDataToSubLcd(b: Byte; b1: TJavaArray<Byte>; iSubLcdCallback: JISubLcdCallback): Boolean; cdecl;
    function doSendDataToUpgradeSubLcd(b: Byte; string_: JString; iSubLcdCallback: JISubLcdCallback): Boolean; cdecl;
    function doSendQRCodeToSubLcd(string_: JString; iSubLcdCallback: JISubLcdCallback): Boolean; cdecl;
    function doSendTextToSubLcd(string_: JString; iSubLcdCallback: JISubLcdCallback): Boolean; cdecl;
    function doSendURIToSubLcd(string_: JString; iSubLcdCallback: JISubLcdCallback): Boolean; cdecl;
  end;

  TJISubLcdService = class(TJavaGenericImport<JISubLcdServiceClass, JISubLcdService>)
  end;

  JISubLcdService_StubClass = interface(JBinderClass)
    ['{46CC08DB-D19E-4C50-A91F-DEC8D0932C37}']
    { class }
    function _GetTRANSACTION_doReadDataPackage: Integer; cdecl;
    { class }     function _GetTRANSACTION_doSendTextToSubLcd: Integer; cdecl;
    { class }     function asInterface(iBinder: JIBinder): JISubLcdService; cdecl;
    { class }     function init: JISubLcdService_Stub; cdecl; // Deprecated
    { class }
    property TRANSACTION_doReadDataPackage: Integer read _GetTRANSACTION_doReadDataPackage;
    { class }     property TRANSACTION_doSendTextToSubLcd: Integer read _GetTRANSACTION_doSendTextToSubLcd;
  end;

  [JavaSignature('com/xcheng/sublcdservice/ISubLcdService$Stub')]
  JISubLcdService_Stub = interface(JBinder)
    ['{D139D264-82BA-44D4-9B57-75892273A2B5}']
    function asBinder: JIBinder; cdecl;
    function onTransact(i: Integer; parcel: JParcel; parcel1: JParcel; i1: Integer): Boolean; cdecl;
  end;

  TJISubLcdService_Stub = class(TJavaGenericImport<JISubLcdService_StubClass, JISubLcdService_Stub>)
  end;

  JISubLcdService_Stub_ProxyClass = interface(JISubLcdServiceClass)
    ['{60B1E753-788C-4335-B495-9667E7C78394}']
  end;

  [JavaSignature('com/xcheng/sublcdservice/ISubLcdService$Stub$Proxy')]
  JISubLcdService_Stub_Proxy = interface(JISubLcdService)
    ['{FB795F14-5C0C-40D2-8E5D-78B178424118}']
    function asBinder: JIBinder; cdecl;
    function doReadDataPackage(iSubLcdCallback: JISubLcdCallback): Boolean; cdecl;
    function doSendBitmapToSubLcd(bitmap: JBitmap; iSubLcdCallback: JISubLcdCallback): Boolean; cdecl;
    function doSendDataToSubLcd(b: Byte; b1: TJavaArray<Byte>; iSubLcdCallback: JISubLcdCallback): Boolean; cdecl;
    function doSendDataToUpgradeSubLcd(b: Byte; string_: JString; iSubLcdCallback: JISubLcdCallback): Boolean; cdecl;
    function doSendQRCodeToSubLcd(string_: JString; iSubLcdCallback: JISubLcdCallback): Boolean; cdecl;
    function doSendTextToSubLcd(string_: JString; iSubLcdCallback: JISubLcdCallback): Boolean; cdecl;
    function doSendURIToSubLcd(string_: JString; iSubLcdCallback: JISubLcdCallback): Boolean; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
  end;

  TJISubLcdService_Stub_Proxy = class(TJavaGenericImport<JISubLcdService_Stub_ProxyClass, JISubLcdService_Stub_Proxy>)
  end;

  JSubLcdUtils2Class = interface(JObjectClass)
    ['{62672743-F144-4CC8-AD3C-09263AE3FB7F}']
    { class }
    function _GetSUBLCD_HEIGHT: Integer; cdecl;
    { class }     function _GetSUBLCD_PACKAGE: JString; cdecl;
    { class }     function _GetSUBLCD_WIDTH: Integer; cdecl;
    { class }     function _GetTAG: JString; cdecl;
    { class }     function init(context: JContext; subLcdUtilsListener: JSubLcdUtils2_SubLcdUtilsListener): JSubLcdUtils2; cdecl; // Deprecated
    { class }
    property SUBLCD_HEIGHT: Integer read _GetSUBLCD_HEIGHT;
    { class }     property SUBLCD_PACKAGE: JString read _GetSUBLCD_PACKAGE;
    { class }     property SUBLCD_WIDTH: Integer read _GetSUBLCD_WIDTH;
    { class }     property TAG: JString read _GetTAG;
  end;

  [JavaSignature('com/xcheng/sublcdservice/SubLcdUtils2')]
  JSubLcdUtils2 = interface(JObject)
    ['{7E187A41-B0CE-47CE-9F64-A6AE512BD5E8}']
    procedure doReadDataPackage; cdecl;
    procedure doSendBitmapToSubLcd(bitmap: JBitmap); cdecl;
    procedure doSendDataToSubLcd(b: Byte; b1: TJavaArray<Byte>); cdecl;
    procedure doSendDataToUpgradeSubLcd(b: Byte; string_: JString); cdecl;
    procedure doSendQRCodeToSubLcd(string_: JString); cdecl;
    procedure doSendTextToSubLcd(string_: JString); cdecl;
    procedure doSubLcdInit; cdecl;
    procedure doSubLcdStart; cdecl;
    procedure doSubLcdStop; cdecl;
  end;

  TJSubLcdUtils2 = class(TJavaGenericImport<JSubLcdUtils2Class, JSubLcdUtils2>)
  end;

  JSubLcdUtils2_1Class = interface(JServiceConnectionClass)
    ['{C4F5F6A2-4632-4CCF-93E8-7A8617D9425F}']
    { class }
    function init(subLcdUtils2: JSubLcdUtils2): JSubLcdUtils2_1; cdecl;
  end;

  [JavaSignature('com/xcheng/sublcdservice/SubLcdUtils2$1')]
  JSubLcdUtils2_1 = interface(JServiceConnection)
    ['{FB7A3CCC-A2F6-46CC-AB36-1B4135133738}']
    procedure onServiceConnected(componentName: JComponentName; iBinder: JIBinder); cdecl;
    procedure onServiceDisconnected(componentName: JComponentName); cdecl;
  end;

  TJSubLcdUtils2_1 = class(TJavaGenericImport<JSubLcdUtils2_1Class, JSubLcdUtils2_1>)
  end;

  JSubLcdUtils2_2Class = interface(JISubLcdCallback_StubClass)
    ['{260E93AD-5DB7-4362-BE8E-21E6926FA2A3}']
    { class }
    function init(subLcdUtils2: JSubLcdUtils2): JSubLcdUtils2_2; cdecl;
  end;

  [JavaSignature('com/xcheng/sublcdservice/SubLcdUtils2$2')]
  JSubLcdUtils2_2 = interface(JISubLcdCallback_Stub)
    ['{2D883E99-DEBC-4C67-8AC1-FE05663741A1}']
    function _Getthis: JSubLcdUtils2; cdecl;
    procedure onReply(b: Byte; i: Integer; string_: JString); cdecl;
    property this: JSubLcdUtils2 read _Getthis;
  end;

  TJSubLcdUtils2_2 = class(TJavaGenericImport<JSubLcdUtils2_2Class, JSubLcdUtils2_2>)
  end;

  JSubLcdUtils2_SubLcdReceiveDataClass = interface(JSerializableClass)
    ['{DF6A4DE0-BA4B-4AFB-AF6F-1C0DD01BE434}']
    { class }
    function _Getcmd: Integer; cdecl;
    { class }     procedure _Setcmd(value: Integer); cdecl;
    { class }     function init(subLcdUtils2: JSubLcdUtils2): JSubLcdUtils2_SubLcdReceiveData; cdecl; // Deprecated
    { class }
    property cmd: Integer read _Getcmd write _Setcmd;
  end;

  [JavaSignature('com/xcheng/sublcdservice/SubLcdUtils2$SubLcdReceiveData')]
  JSubLcdUtils2_SubLcdReceiveData = interface(JSerializable)
    ['{02382ACE-A113-433F-B607-7FB513953F09}']
    function _Getcrc: Boolean; cdecl;
    function _Getdata: JString; cdecl;
    function _Getsize: Integer; cdecl;
    function _Getstatus: Integer; cdecl;
    procedure _Setstatus(value: Integer); cdecl;
    function _Getthis: JSubLcdUtils2; cdecl;
    property crc: Boolean read _Getcrc;
    property data: JString read _Getdata;
    property size: Integer read _Getsize;
    property status: Integer read _Getstatus write _Setstatus;
    property this: JSubLcdUtils2 read _Getthis;
  end;

  TJSubLcdUtils2_SubLcdReceiveData = class(TJavaGenericImport<JSubLcdUtils2_SubLcdReceiveDataClass, JSubLcdUtils2_SubLcdReceiveData>)
  end;

  JSubLcdUtils2_SubLcdUtilsListenerClass = interface(IJavaClass)
    ['{5C4E0504-1D66-4C32-8AA5-D61BFA08A490}']
  end;

  [JavaSignature('com/xcheng/sublcdservice/SubLcdUtils2$SubLcdUtilsListener')]
  JSubLcdUtils2_SubLcdUtilsListener = interface(IJavaInstance)
    ['{67437254-21F8-41E2-BDB4-C813EB46C455}']
    procedure onReplyData(subLcdReceiveData: JSubLcdUtils2_SubLcdReceiveData); cdecl;
    procedure onServiceConnected; cdecl;
  end;

  TJSubLcdUtils2_SubLcdUtilsListener = class(TJavaGenericImport<JSubLcdUtils2_SubLcdUtilsListenerClass, JSubLcdUtils2_SubLcdUtilsListener>)
  end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('GS300Interfaces.JAnimator', TypeInfo(GS300Interfaces.JAnimator));
  TRegTypes.RegisterType('GS300Interfaces.JAnimator_AnimatorListener', TypeInfo(GS300Interfaces.JAnimator_AnimatorListener));
  TRegTypes.RegisterType('GS300Interfaces.JAnimator_AnimatorPauseListener', TypeInfo(GS300Interfaces.JAnimator_AnimatorPauseListener));
  TRegTypes.RegisterType('GS300Interfaces.JKeyframe', TypeInfo(GS300Interfaces.JKeyframe));
  TRegTypes.RegisterType('GS300Interfaces.JLayoutTransition', TypeInfo(GS300Interfaces.JLayoutTransition));
  TRegTypes.RegisterType('GS300Interfaces.JLayoutTransition_TransitionListener', TypeInfo(GS300Interfaces.JLayoutTransition_TransitionListener));
  TRegTypes.RegisterType('GS300Interfaces.JPropertyValuesHolder', TypeInfo(GS300Interfaces.JPropertyValuesHolder));
  TRegTypes.RegisterType('GS300Interfaces.JStateListAnimator', TypeInfo(GS300Interfaces.JStateListAnimator));
  TRegTypes.RegisterType('GS300Interfaces.JTimeInterpolator', TypeInfo(GS300Interfaces.JTimeInterpolator));
  TRegTypes.RegisterType('GS300Interfaces.JTypeConverter', TypeInfo(GS300Interfaces.JTypeConverter));
  TRegTypes.RegisterType('GS300Interfaces.JTypeEvaluator', TypeInfo(GS300Interfaces.JTypeEvaluator));
  TRegTypes.RegisterType('GS300Interfaces.JValueAnimator', TypeInfo(GS300Interfaces.JValueAnimator));
  TRegTypes.RegisterType('GS300Interfaces.JValueAnimator_AnimatorUpdateListener', TypeInfo(GS300Interfaces.JValueAnimator_AnimatorUpdateListener));
  TRegTypes.RegisterType('GS300Interfaces.JPathMotion', TypeInfo(GS300Interfaces.JPathMotion));
  TRegTypes.RegisterType('GS300Interfaces.JScene', TypeInfo(GS300Interfaces.JScene));
  TRegTypes.RegisterType('GS300Interfaces.JTransition', TypeInfo(GS300Interfaces.JTransition));
  TRegTypes.RegisterType('GS300Interfaces.JTransition_EpicenterCallback', TypeInfo(GS300Interfaces.JTransition_EpicenterCallback));
  TRegTypes.RegisterType('GS300Interfaces.JTransition_TransitionListener', TypeInfo(GS300Interfaces.JTransition_TransitionListener));
  TRegTypes.RegisterType('GS300Interfaces.JTransitionManager', TypeInfo(GS300Interfaces.JTransitionManager));
  TRegTypes.RegisterType('GS300Interfaces.JTransitionPropagation', TypeInfo(GS300Interfaces.JTransitionPropagation));
  TRegTypes.RegisterType('GS300Interfaces.JTransitionValues', TypeInfo(GS300Interfaces.JTransitionValues));
  TRegTypes.RegisterType('GS300Interfaces.JInterpolator', TypeInfo(GS300Interfaces.JInterpolator));
  TRegTypes.RegisterType('GS300Interfaces.JToolbar_LayoutParams', TypeInfo(GS300Interfaces.JToolbar_LayoutParams));
  TRegTypes.RegisterType('GS300Interfaces.JSubLcdCommon', TypeInfo(GS300Interfaces.JSubLcdCommon));
  TRegTypes.RegisterType('GS300Interfaces.JBaseSubLcd', TypeInfo(GS300Interfaces.JBaseSubLcd));
  TRegTypes.RegisterType('GS300Interfaces.JBaseSubLcd_MyReceiver', TypeInfo(GS300Interfaces.JBaseSubLcd_MyReceiver));
  TRegTypes.RegisterType('GS300Interfaces.JOnSubCallback', TypeInfo(GS300Interfaces.JOnSubCallback));
  TRegTypes.RegisterType('GS300Interfaces.JRQCode', TypeInfo(GS300Interfaces.JRQCode));
  TRegTypes.RegisterType('GS300Interfaces.JReceiverDataServices', TypeInfo(GS300Interfaces.JReceiverDataServices));
  // TRegTypes.RegisterType('GS300Interfaces.JReceiverDataServices_1', TypeInfo(GS300Interfaces.JReceiverDataServices_1));
  TRegTypes.RegisterType('GS300Interfaces.JReceiverDataServices_LocalBinder', TypeInfo(GS300Interfaces.JReceiverDataServices_LocalBinder));
  TRegTypes.RegisterType('GS300Interfaces.JSubLcdConstant', TypeInfo(GS300Interfaces.JSubLcdConstant));
  TRegTypes.RegisterType('GS300Interfaces.JSubLcdException', TypeInfo(GS300Interfaces.JSubLcdException));
  TRegTypes.RegisterType('GS300Interfaces.JSubLcdHelper', TypeInfo(GS300Interfaces.JSubLcdHelper));
  TRegTypes.RegisterType('GS300Interfaces.JSubLcdHelper_VuleCalBack', TypeInfo(GS300Interfaces.JSubLcdHelper_VuleCalBack));
  TRegTypes.RegisterType('GS300Interfaces.JAP80_BuildConfig', TypeInfo(GS300Interfaces.JAP80_BuildConfig));
  TRegTypes.RegisterType('GS300Interfaces.JIPrinter', TypeInfo(GS300Interfaces.JIPrinter));
  TRegTypes.RegisterType('GS300Interfaces.JAbstractPrinter', TypeInfo(GS300Interfaces.JAbstractPrinter));
  TRegTypes.RegisterType('GS300Interfaces.JInnerLcdCallback', TypeInfo(GS300Interfaces.JInnerLcdCallback));
  TRegTypes.RegisterType('GS300Interfaces.JInnerPrinterCallback', TypeInfo(GS300Interfaces.JInnerPrinterCallback));
  TRegTypes.RegisterType('GS300Interfaces.JInnerPrinterException', TypeInfo(GS300Interfaces.JInnerPrinterException));
  TRegTypes.RegisterType('GS300Interfaces.JInnerPrinterManager', TypeInfo(GS300Interfaces.JInnerPrinterManager));
  TRegTypes.RegisterType('GS300Interfaces.JInnerPrinterManager_1', TypeInfo(GS300Interfaces.JInnerPrinterManager_1));
  TRegTypes.RegisterType('GS300Interfaces.JInnerPrinterManager_SingletonContainer', TypeInfo(GS300Interfaces.JInnerPrinterManager_SingletonContainer));
  TRegTypes.RegisterType('GS300Interfaces.JIPrinterCallback_Stub', TypeInfo(GS300Interfaces.JIPrinterCallback_Stub));
  TRegTypes.RegisterType('GS300Interfaces.JInnerResultCallback', TypeInfo(GS300Interfaces.JInnerResultCallback));
  TRegTypes.RegisterType('GS300Interfaces.JPrinterConfigs', TypeInfo(GS300Interfaces.JPrinterConfigs));
  TRegTypes.RegisterType('GS300Interfaces.JPrinterConsts', TypeInfo(GS300Interfaces.JPrinterConsts));
  TRegTypes.RegisterType('GS300Interfaces.JPrinterFactoryUtils', TypeInfo(GS300Interfaces.JPrinterFactoryUtils));
  TRegTypes.RegisterType('GS300Interfaces.JFormatAlignHelper', TypeInfo(GS300Interfaces.JFormatAlignHelper));
  TRegTypes.RegisterType('GS300Interfaces.JPrinterAttributes', TypeInfo(GS300Interfaces.JPrinterAttributes));
  TRegTypes.RegisterType('GS300Interfaces.JPrinterAttributes_1', TypeInfo(GS300Interfaces.JPrinterAttributes_1));
  TRegTypes.RegisterType('GS300Interfaces.JContentHelper', TypeInfo(GS300Interfaces.JContentHelper));
  TRegTypes.RegisterType('GS300Interfaces.JPrinterViewManager', TypeInfo(GS300Interfaces.JPrinterViewManager));
  TRegTypes.RegisterType('GS300Interfaces.Jutils_FileUtils', TypeInfo(GS300Interfaces.Jutils_FileUtils));
  TRegTypes.RegisterType('GS300Interfaces.JStringUtils', TypeInfo(GS300Interfaces.JStringUtils));
  TRegTypes.RegisterType('GS300Interfaces.JAP80PrintHelper', TypeInfo(GS300Interfaces.JAP80PrintHelper));
  TRegTypes.RegisterType('GS300Interfaces.JAP80PrintHelper_1', TypeInfo(GS300Interfaces.JAP80PrintHelper_1));
  TRegTypes.RegisterType('GS300Interfaces.JAP80PrintHelper_2', TypeInfo(GS300Interfaces.JAP80PrintHelper_2));
  TRegTypes.RegisterType('GS300Interfaces.JAP80PrintService', TypeInfo(GS300Interfaces.JAP80PrintService));
  TRegTypes.RegisterType('GS300Interfaces.JBytesUtil', TypeInfo(GS300Interfaces.JBytesUtil));
  TRegTypes.RegisterType('GS300Interfaces.JDeviceInfoUtils', TypeInfo(GS300Interfaces.JDeviceInfoUtils));
  TRegTypes.RegisterType('GS300Interfaces.JESCUtil', TypeInfo(GS300Interfaces.JESCUtil));
  TRegTypes.RegisterType('GS300Interfaces.JP80EscCommand', TypeInfo(GS300Interfaces.JP80EscCommand));
  TRegTypes.RegisterType('GS300Interfaces.JBarcodeFormat', TypeInfo(GS300Interfaces.JBarcodeFormat));
  TRegTypes.RegisterType('GS300Interfaces.JBinarizer', TypeInfo(GS300Interfaces.JBinarizer));
  TRegTypes.RegisterType('GS300Interfaces.JBinaryBitmap', TypeInfo(GS300Interfaces.JBinaryBitmap));
  TRegTypes.RegisterType('GS300Interfaces.JReaderException', TypeInfo(GS300Interfaces.JReaderException));
  TRegTypes.RegisterType('GS300Interfaces.JChecksumException', TypeInfo(GS300Interfaces.JChecksumException));
  TRegTypes.RegisterType('GS300Interfaces.JDecodeHintType', TypeInfo(GS300Interfaces.JDecodeHintType));
  TRegTypes.RegisterType('GS300Interfaces.Jzxing_Dimension', TypeInfo(GS300Interfaces.Jzxing_Dimension));
  TRegTypes.RegisterType('GS300Interfaces.JEncodeHintType', TypeInfo(GS300Interfaces.JEncodeHintType));
  TRegTypes.RegisterType('GS300Interfaces.Jzxing_FormatException', TypeInfo(GS300Interfaces.Jzxing_FormatException));
  TRegTypes.RegisterType('GS300Interfaces.JLuminanceSource', TypeInfo(GS300Interfaces.JLuminanceSource));
  TRegTypes.RegisterType('GS300Interfaces.JInvertedLuminanceSource', TypeInfo(GS300Interfaces.JInvertedLuminanceSource));
  TRegTypes.RegisterType('GS300Interfaces.Jzxing_Reader', TypeInfo(GS300Interfaces.Jzxing_Reader));
  TRegTypes.RegisterType('GS300Interfaces.JMultiFormatReader', TypeInfo(GS300Interfaces.JMultiFormatReader));
  TRegTypes.RegisterType('GS300Interfaces.Jzxing_Writer', TypeInfo(GS300Interfaces.Jzxing_Writer));
  TRegTypes.RegisterType('GS300Interfaces.JMultiFormatWriter', TypeInfo(GS300Interfaces.JMultiFormatWriter));
  TRegTypes.RegisterType('GS300Interfaces.JMultiFormatWriter_1', TypeInfo(GS300Interfaces.JMultiFormatWriter_1));
  TRegTypes.RegisterType('GS300Interfaces.JNotFoundException', TypeInfo(GS300Interfaces.JNotFoundException));
  TRegTypes.RegisterType('GS300Interfaces.JPlanarYUVLuminanceSource', TypeInfo(GS300Interfaces.JPlanarYUVLuminanceSource));
  TRegTypes.RegisterType('GS300Interfaces.JRGBLuminanceSource', TypeInfo(GS300Interfaces.JRGBLuminanceSource));
  TRegTypes.RegisterType('GS300Interfaces.Jzxing_Result', TypeInfo(GS300Interfaces.Jzxing_Result));
  TRegTypes.RegisterType('GS300Interfaces.JResultMetadataType', TypeInfo(GS300Interfaces.JResultMetadataType));
  TRegTypes.RegisterType('GS300Interfaces.JResultPoint', TypeInfo(GS300Interfaces.JResultPoint));
  TRegTypes.RegisterType('GS300Interfaces.JResultPointCallback', TypeInfo(GS300Interfaces.JResultPointCallback));
  TRegTypes.RegisterType('GS300Interfaces.JWriterException', TypeInfo(GS300Interfaces.JWriterException));
  TRegTypes.RegisterType('GS300Interfaces.JDetectorResult', TypeInfo(GS300Interfaces.JDetectorResult));
  TRegTypes.RegisterType('GS300Interfaces.JAztecDetectorResult', TypeInfo(GS300Interfaces.JAztecDetectorResult));
  TRegTypes.RegisterType('GS300Interfaces.JAztecReader', TypeInfo(GS300Interfaces.JAztecReader));
  TRegTypes.RegisterType('GS300Interfaces.JAztecWriter', TypeInfo(GS300Interfaces.JAztecWriter));
  TRegTypes.RegisterType('GS300Interfaces.Jdecoder_Decoder', TypeInfo(GS300Interfaces.Jdecoder_Decoder));
  TRegTypes.RegisterType('GS300Interfaces.JDecoder_1', TypeInfo(GS300Interfaces.JDecoder_1));
  TRegTypes.RegisterType('GS300Interfaces.JDecoder_CorrectedBitsResult', TypeInfo(GS300Interfaces.JDecoder_CorrectedBitsResult));
  TRegTypes.RegisterType('GS300Interfaces.JDecoder_Table', TypeInfo(GS300Interfaces.JDecoder_Table));
  TRegTypes.RegisterType('GS300Interfaces.JDetector', TypeInfo(GS300Interfaces.JDetector));
  TRegTypes.RegisterType('GS300Interfaces.JDetector_CorrectedParameter', TypeInfo(GS300Interfaces.JDetector_CorrectedParameter));
  TRegTypes.RegisterType('GS300Interfaces.JDetector_Point', TypeInfo(GS300Interfaces.JDetector_Point));
  TRegTypes.RegisterType('GS300Interfaces.JAztecCode', TypeInfo(GS300Interfaces.JAztecCode));
  TRegTypes.RegisterType('GS300Interfaces.JToken', TypeInfo(GS300Interfaces.JToken));
  TRegTypes.RegisterType('GS300Interfaces.JBinaryShiftToken', TypeInfo(GS300Interfaces.JBinaryShiftToken));
  TRegTypes.RegisterType('GS300Interfaces.Jencoder_Encoder', TypeInfo(GS300Interfaces.Jencoder_Encoder));
  TRegTypes.RegisterType('GS300Interfaces.JHighLevelEncoder', TypeInfo(GS300Interfaces.JHighLevelEncoder));
  TRegTypes.RegisterType('GS300Interfaces.JHighLevelEncoder_1', TypeInfo(GS300Interfaces.JHighLevelEncoder_1));
  TRegTypes.RegisterType('GS300Interfaces.JSimpleToken', TypeInfo(GS300Interfaces.JSimpleToken));
  TRegTypes.RegisterType('GS300Interfaces.JState', TypeInfo(GS300Interfaces.JState));
  TRegTypes.RegisterType('GS300Interfaces.JResultParser', TypeInfo(GS300Interfaces.JResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JAbstractDoCoMoResultParser', TypeInfo(GS300Interfaces.JAbstractDoCoMoResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JAddressBookAUResultParser', TypeInfo(GS300Interfaces.JAddressBookAUResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JAddressBookDoCoMoResultParser', TypeInfo(GS300Interfaces.JAddressBookDoCoMoResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JParsedResult', TypeInfo(GS300Interfaces.JParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JAddressBookParsedResult', TypeInfo(GS300Interfaces.JAddressBookParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JBizcardResultParser', TypeInfo(GS300Interfaces.JBizcardResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JBookmarkDoCoMoResultParser', TypeInfo(GS300Interfaces.JBookmarkDoCoMoResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JCalendarParsedResult', TypeInfo(GS300Interfaces.JCalendarParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JEmailAddressParsedResult', TypeInfo(GS300Interfaces.JEmailAddressParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JEmailAddressResultParser', TypeInfo(GS300Interfaces.JEmailAddressResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JEmailDoCoMoResultParser', TypeInfo(GS300Interfaces.JEmailDoCoMoResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JExpandedProductParsedResult', TypeInfo(GS300Interfaces.JExpandedProductParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JExpandedProductResultParser', TypeInfo(GS300Interfaces.JExpandedProductResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JGeoParsedResult', TypeInfo(GS300Interfaces.JGeoParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JGeoResultParser', TypeInfo(GS300Interfaces.JGeoResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JISBNParsedResult', TypeInfo(GS300Interfaces.JISBNParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JISBNResultParser', TypeInfo(GS300Interfaces.JISBNResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JParsedResultType', TypeInfo(GS300Interfaces.JParsedResultType));
  TRegTypes.RegisterType('GS300Interfaces.JProductParsedResult', TypeInfo(GS300Interfaces.JProductParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JProductResultParser', TypeInfo(GS300Interfaces.JProductResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JSMSMMSResultParser', TypeInfo(GS300Interfaces.JSMSMMSResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JSMSParsedResult', TypeInfo(GS300Interfaces.JSMSParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JSMSTOMMSTOResultParser', TypeInfo(GS300Interfaces.JSMSTOMMSTOResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JSMTPResultParser', TypeInfo(GS300Interfaces.JSMTPResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JTelParsedResult', TypeInfo(GS300Interfaces.JTelParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JTelResultParser', TypeInfo(GS300Interfaces.JTelResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JTextParsedResult', TypeInfo(GS300Interfaces.JTextParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JURIParsedResult', TypeInfo(GS300Interfaces.JURIParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JURIResultParser', TypeInfo(GS300Interfaces.JURIResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JURLTOResultParser', TypeInfo(GS300Interfaces.JURLTOResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JVCardResultParser', TypeInfo(GS300Interfaces.JVCardResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JVEventResultParser', TypeInfo(GS300Interfaces.JVEventResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JVINParsedResult', TypeInfo(GS300Interfaces.JVINParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JVINResultParser', TypeInfo(GS300Interfaces.JVINResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JWifiParsedResult', TypeInfo(GS300Interfaces.JWifiParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JWifiResultParser', TypeInfo(GS300Interfaces.JWifiResultParser));
  TRegTypes.RegisterType('GS300Interfaces.JBitArray', TypeInfo(GS300Interfaces.JBitArray));
  TRegTypes.RegisterType('GS300Interfaces.JBitMatrix', TypeInfo(GS300Interfaces.JBitMatrix));
  TRegTypes.RegisterType('GS300Interfaces.JBitSource', TypeInfo(GS300Interfaces.JBitSource));
  TRegTypes.RegisterType('GS300Interfaces.JCharacterSetECI', TypeInfo(GS300Interfaces.JCharacterSetECI));
  TRegTypes.RegisterType('GS300Interfaces.JDecoderResult', TypeInfo(GS300Interfaces.JDecoderResult));
  TRegTypes.RegisterType('GS300Interfaces.JGridSampler', TypeInfo(GS300Interfaces.JGridSampler));
  TRegTypes.RegisterType('GS300Interfaces.JDefaultGridSampler', TypeInfo(GS300Interfaces.JDefaultGridSampler));
  TRegTypes.RegisterType('GS300Interfaces.JECIEncoderSet', TypeInfo(GS300Interfaces.JECIEncoderSet));
  TRegTypes.RegisterType('GS300Interfaces.JECIInput', TypeInfo(GS300Interfaces.JECIInput));
  TRegTypes.RegisterType('GS300Interfaces.JECIStringBuilder', TypeInfo(GS300Interfaces.JECIStringBuilder));
  TRegTypes.RegisterType('GS300Interfaces.JGlobalHistogramBinarizer', TypeInfo(GS300Interfaces.JGlobalHistogramBinarizer));
  TRegTypes.RegisterType('GS300Interfaces.JHybridBinarizer', TypeInfo(GS300Interfaces.JHybridBinarizer));
  TRegTypes.RegisterType('GS300Interfaces.JMinimalECIInput', TypeInfo(GS300Interfaces.JMinimalECIInput));
  TRegTypes.RegisterType('GS300Interfaces.JMinimalECIInput_1', TypeInfo(GS300Interfaces.JMinimalECIInput_1));
  TRegTypes.RegisterType('GS300Interfaces.JMinimalECIInput_InputEdge', TypeInfo(GS300Interfaces.JMinimalECIInput_InputEdge));
  TRegTypes.RegisterType('GS300Interfaces.JPerspectiveTransform', TypeInfo(GS300Interfaces.JPerspectiveTransform));
  TRegTypes.RegisterType('GS300Interfaces.Jcommon_StringUtils', TypeInfo(GS300Interfaces.Jcommon_StringUtils));
  TRegTypes.RegisterType('GS300Interfaces.Jdetector_MathUtils', TypeInfo(GS300Interfaces.Jdetector_MathUtils));
  TRegTypes.RegisterType('GS300Interfaces.JMonochromeRectangleDetector', TypeInfo(GS300Interfaces.JMonochromeRectangleDetector));
  TRegTypes.RegisterType('GS300Interfaces.JWhiteRectangleDetector', TypeInfo(GS300Interfaces.JWhiteRectangleDetector));
  TRegTypes.RegisterType('GS300Interfaces.JGenericGF', TypeInfo(GS300Interfaces.JGenericGF));
  TRegTypes.RegisterType('GS300Interfaces.JGenericGFPoly', TypeInfo(GS300Interfaces.JGenericGFPoly));
  TRegTypes.RegisterType('GS300Interfaces.JReedSolomonDecoder', TypeInfo(GS300Interfaces.JReedSolomonDecoder));
  TRegTypes.RegisterType('GS300Interfaces.JReedSolomonEncoder', TypeInfo(GS300Interfaces.JReedSolomonEncoder));
  TRegTypes.RegisterType('GS300Interfaces.JReedSolomonException', TypeInfo(GS300Interfaces.JReedSolomonException));
  TRegTypes.RegisterType('GS300Interfaces.JDataMatrixReader', TypeInfo(GS300Interfaces.JDataMatrixReader));
  TRegTypes.RegisterType('GS300Interfaces.JDataMatrixWriter', TypeInfo(GS300Interfaces.JDataMatrixWriter));
  TRegTypes.RegisterType('GS300Interfaces.JBitMatrixParser', TypeInfo(GS300Interfaces.JBitMatrixParser));
  TRegTypes.RegisterType('GS300Interfaces.JDataBlock', TypeInfo(GS300Interfaces.JDataBlock));
  TRegTypes.RegisterType('GS300Interfaces.JDecodedBitStreamParser', TypeInfo(GS300Interfaces.JDecodedBitStreamParser));
  TRegTypes.RegisterType('GS300Interfaces.JDecodedBitStreamParser_1', TypeInfo(GS300Interfaces.JDecodedBitStreamParser_1));
  TRegTypes.RegisterType('GS300Interfaces.JDecodedBitStreamParser_Mode', TypeInfo(GS300Interfaces.JDecodedBitStreamParser_Mode));
  TRegTypes.RegisterType('GS300Interfaces.Jdatamatrix_decoder_Decoder', TypeInfo(GS300Interfaces.Jdatamatrix_decoder_Decoder));
  TRegTypes.RegisterType('GS300Interfaces.Jdecoder_Version', TypeInfo(GS300Interfaces.Jdecoder_Version));
  TRegTypes.RegisterType('GS300Interfaces.JVersion_1', TypeInfo(GS300Interfaces.JVersion_1));
  TRegTypes.RegisterType('GS300Interfaces.JVersion_ECB', TypeInfo(GS300Interfaces.JVersion_ECB));
  TRegTypes.RegisterType('GS300Interfaces.JVersion_ECBlocks', TypeInfo(GS300Interfaces.JVersion_ECBlocks));
  TRegTypes.RegisterType('GS300Interfaces.Jdetector_Detector', TypeInfo(GS300Interfaces.Jdetector_Detector));
  TRegTypes.RegisterType('GS300Interfaces.Jdatamatrix_encoder_Encoder', TypeInfo(GS300Interfaces.Jdatamatrix_encoder_Encoder));
  TRegTypes.RegisterType('GS300Interfaces.JASCIIEncoder', TypeInfo(GS300Interfaces.JASCIIEncoder));
  TRegTypes.RegisterType('GS300Interfaces.JBase256Encoder', TypeInfo(GS300Interfaces.JBase256Encoder));
  TRegTypes.RegisterType('GS300Interfaces.JC40Encoder', TypeInfo(GS300Interfaces.JC40Encoder));
  TRegTypes.RegisterType('GS300Interfaces.JSymbolInfo', TypeInfo(GS300Interfaces.JSymbolInfo));
  TRegTypes.RegisterType('GS300Interfaces.JDataMatrixSymbolInfo144', TypeInfo(GS300Interfaces.JDataMatrixSymbolInfo144));
  TRegTypes.RegisterType('GS300Interfaces.JDefaultPlacement', TypeInfo(GS300Interfaces.JDefaultPlacement));
  TRegTypes.RegisterType('GS300Interfaces.JEdifactEncoder', TypeInfo(GS300Interfaces.JEdifactEncoder));
  TRegTypes.RegisterType('GS300Interfaces.JEncoderContext', TypeInfo(GS300Interfaces.JEncoderContext));
  TRegTypes.RegisterType('GS300Interfaces.JErrorCorrection', TypeInfo(GS300Interfaces.JErrorCorrection));
  TRegTypes.RegisterType('GS300Interfaces.Jencoder_HighLevelEncoder', TypeInfo(GS300Interfaces.Jencoder_HighLevelEncoder));
  TRegTypes.RegisterType('GS300Interfaces.JMinimalEncoder', TypeInfo(GS300Interfaces.JMinimalEncoder));
  TRegTypes.RegisterType('GS300Interfaces.JMinimalEncoder_1', TypeInfo(GS300Interfaces.JMinimalEncoder_1));
  TRegTypes.RegisterType('GS300Interfaces.JMinimalEncoder_Edge', TypeInfo(GS300Interfaces.JMinimalEncoder_Edge));
  TRegTypes.RegisterType('GS300Interfaces.JMinimalEncoder_Input', TypeInfo(GS300Interfaces.JMinimalEncoder_Input));
  TRegTypes.RegisterType('GS300Interfaces.JMinimalEncoder_Mode', TypeInfo(GS300Interfaces.JMinimalEncoder_Mode));
  TRegTypes.RegisterType('GS300Interfaces.JMinimalEncoder_Result', TypeInfo(GS300Interfaces.JMinimalEncoder_Result));
  TRegTypes.RegisterType('GS300Interfaces.JSymbolShapeHint', TypeInfo(GS300Interfaces.JSymbolShapeHint));
  TRegTypes.RegisterType('GS300Interfaces.JTextEncoder', TypeInfo(GS300Interfaces.JTextEncoder));
  TRegTypes.RegisterType('GS300Interfaces.JX12Encoder', TypeInfo(GS300Interfaces.JX12Encoder));
  TRegTypes.RegisterType('GS300Interfaces.JMaxiCodeReader', TypeInfo(GS300Interfaces.JMaxiCodeReader));
  TRegTypes.RegisterType('GS300Interfaces.Jdecoder_BitMatrixParser', TypeInfo(GS300Interfaces.Jdecoder_BitMatrixParser));
  TRegTypes.RegisterType('GS300Interfaces.Jdecoder_DecodedBitStreamParser', TypeInfo(GS300Interfaces.Jdecoder_DecodedBitStreamParser));
  TRegTypes.RegisterType('GS300Interfaces.Jmaxicode_decoder_Decoder', TypeInfo(GS300Interfaces.Jmaxicode_decoder_Decoder));
  TRegTypes.RegisterType('GS300Interfaces.JByQuadrantReader', TypeInfo(GS300Interfaces.JByQuadrantReader));
  TRegTypes.RegisterType('GS300Interfaces.JMultipleBarcodeReader', TypeInfo(GS300Interfaces.JMultipleBarcodeReader));
  TRegTypes.RegisterType('GS300Interfaces.JGenericMultipleBarcodeReader', TypeInfo(GS300Interfaces.JGenericMultipleBarcodeReader));
  TRegTypes.RegisterType('GS300Interfaces.JQRCodeReader', TypeInfo(GS300Interfaces.JQRCodeReader));
  TRegTypes.RegisterType('GS300Interfaces.JQRCodeMultiReader', TypeInfo(GS300Interfaces.JQRCodeMultiReader));
  TRegTypes.RegisterType('GS300Interfaces.JQRCodeMultiReader_1', TypeInfo(GS300Interfaces.JQRCodeMultiReader_1));
  TRegTypes.RegisterType('GS300Interfaces.JQRCodeMultiReader_SAComparator', TypeInfo(GS300Interfaces.JQRCodeMultiReader_SAComparator));
  TRegTypes.RegisterType('GS300Interfaces.Jqrcode_detector_Detector', TypeInfo(GS300Interfaces.Jqrcode_detector_Detector));
  TRegTypes.RegisterType('GS300Interfaces.JMultiDetector', TypeInfo(GS300Interfaces.JMultiDetector));
  TRegTypes.RegisterType('GS300Interfaces.JFinderPatternFinder', TypeInfo(GS300Interfaces.JFinderPatternFinder));
  TRegTypes.RegisterType('GS300Interfaces.JMultiFinderPatternFinder', TypeInfo(GS300Interfaces.JMultiFinderPatternFinder));
  TRegTypes.RegisterType('GS300Interfaces.JMultiFinderPatternFinder_1', TypeInfo(GS300Interfaces.JMultiFinderPatternFinder_1));
  TRegTypes.RegisterType('GS300Interfaces.JMultiFinderPatternFinder_ModuleSizeComparator', TypeInfo(GS300Interfaces.JMultiFinderPatternFinder_ModuleSizeComparator));
  TRegTypes.RegisterType('GS300Interfaces.JOneDReader', TypeInfo(GS300Interfaces.JOneDReader));
  TRegTypes.RegisterType('GS300Interfaces.JCodaBarReader', TypeInfo(GS300Interfaces.JCodaBarReader));
  TRegTypes.RegisterType('GS300Interfaces.JOneDimensionalCodeWriter', TypeInfo(GS300Interfaces.JOneDimensionalCodeWriter));
  TRegTypes.RegisterType('GS300Interfaces.JCodaBarWriter', TypeInfo(GS300Interfaces.JCodaBarWriter));
  TRegTypes.RegisterType('GS300Interfaces.JCode128Reader', TypeInfo(GS300Interfaces.JCode128Reader));
  TRegTypes.RegisterType('GS300Interfaces.JCode128Writer', TypeInfo(GS300Interfaces.JCode128Writer));
  TRegTypes.RegisterType('GS300Interfaces.JCode128Writer_1', TypeInfo(GS300Interfaces.JCode128Writer_1));
  TRegTypes.RegisterType('GS300Interfaces.JCode128Writer_CType', TypeInfo(GS300Interfaces.JCode128Writer_CType));
  TRegTypes.RegisterType('GS300Interfaces.JCode128Writer_MinimalEncoder', TypeInfo(GS300Interfaces.JCode128Writer_MinimalEncoder));
  TRegTypes.RegisterType('GS300Interfaces.JMinimalEncoder_Charset', TypeInfo(GS300Interfaces.JMinimalEncoder_Charset));
  TRegTypes.RegisterType('GS300Interfaces.JMinimalEncoder_Latch', TypeInfo(GS300Interfaces.JMinimalEncoder_Latch));
  TRegTypes.RegisterType('GS300Interfaces.JCode39Reader', TypeInfo(GS300Interfaces.JCode39Reader));
  TRegTypes.RegisterType('GS300Interfaces.JCode39Writer', TypeInfo(GS300Interfaces.JCode39Writer));
  TRegTypes.RegisterType('GS300Interfaces.JCode93Reader', TypeInfo(GS300Interfaces.JCode93Reader));
  TRegTypes.RegisterType('GS300Interfaces.JCode93Writer', TypeInfo(GS300Interfaces.JCode93Writer));
  TRegTypes.RegisterType('GS300Interfaces.JUPCEANReader', TypeInfo(GS300Interfaces.JUPCEANReader));
  TRegTypes.RegisterType('GS300Interfaces.JEAN13Reader', TypeInfo(GS300Interfaces.JEAN13Reader));
  TRegTypes.RegisterType('GS300Interfaces.JUPCEANWriter', TypeInfo(GS300Interfaces.JUPCEANWriter));
  TRegTypes.RegisterType('GS300Interfaces.JEAN13Writer', TypeInfo(GS300Interfaces.JEAN13Writer));
  TRegTypes.RegisterType('GS300Interfaces.JEAN8Reader', TypeInfo(GS300Interfaces.JEAN8Reader));
  TRegTypes.RegisterType('GS300Interfaces.JEAN8Writer', TypeInfo(GS300Interfaces.JEAN8Writer));
  TRegTypes.RegisterType('GS300Interfaces.JEANManufacturerOrgSupport', TypeInfo(GS300Interfaces.JEANManufacturerOrgSupport));
  TRegTypes.RegisterType('GS300Interfaces.JITFReader', TypeInfo(GS300Interfaces.JITFReader));
  TRegTypes.RegisterType('GS300Interfaces.JITFWriter', TypeInfo(GS300Interfaces.JITFWriter));
  TRegTypes.RegisterType('GS300Interfaces.JMultiFormatOneDReader', TypeInfo(GS300Interfaces.JMultiFormatOneDReader));
  TRegTypes.RegisterType('GS300Interfaces.JMultiFormatUPCEANReader', TypeInfo(GS300Interfaces.JMultiFormatUPCEANReader));
  TRegTypes.RegisterType('GS300Interfaces.JUPCAReader', TypeInfo(GS300Interfaces.JUPCAReader));
  TRegTypes.RegisterType('GS300Interfaces.JUPCAWriter', TypeInfo(GS300Interfaces.JUPCAWriter));
  TRegTypes.RegisterType('GS300Interfaces.JUPCEANExtension2Support', TypeInfo(GS300Interfaces.JUPCEANExtension2Support));
  TRegTypes.RegisterType('GS300Interfaces.JUPCEANExtension5Support', TypeInfo(GS300Interfaces.JUPCEANExtension5Support));
  TRegTypes.RegisterType('GS300Interfaces.JUPCEANExtensionSupport', TypeInfo(GS300Interfaces.JUPCEANExtensionSupport));
  TRegTypes.RegisterType('GS300Interfaces.JUPCEReader', TypeInfo(GS300Interfaces.JUPCEReader));
  TRegTypes.RegisterType('GS300Interfaces.JUPCEWriter', TypeInfo(GS300Interfaces.JUPCEWriter));
  TRegTypes.RegisterType('GS300Interfaces.JAbstractRSSReader', TypeInfo(GS300Interfaces.JAbstractRSSReader));
  TRegTypes.RegisterType('GS300Interfaces.JDataCharacter', TypeInfo(GS300Interfaces.JDataCharacter));
  TRegTypes.RegisterType('GS300Interfaces.Jrss_FinderPattern', TypeInfo(GS300Interfaces.Jrss_FinderPattern));
  TRegTypes.RegisterType('GS300Interfaces.Jrss_Pair', TypeInfo(GS300Interfaces.Jrss_Pair));
  TRegTypes.RegisterType('GS300Interfaces.JRSS14Reader', TypeInfo(GS300Interfaces.JRSS14Reader));
  TRegTypes.RegisterType('GS300Interfaces.JRSSUtils', TypeInfo(GS300Interfaces.JRSSUtils));
  TRegTypes.RegisterType('GS300Interfaces.JBitArrayBuilder', TypeInfo(GS300Interfaces.JBitArrayBuilder));
  TRegTypes.RegisterType('GS300Interfaces.JExpandedPair', TypeInfo(GS300Interfaces.JExpandedPair));
  TRegTypes.RegisterType('GS300Interfaces.JExpandedRow', TypeInfo(GS300Interfaces.JExpandedRow));
  TRegTypes.RegisterType('GS300Interfaces.JRSSExpandedReader', TypeInfo(GS300Interfaces.JRSSExpandedReader));
  TRegTypes.RegisterType('GS300Interfaces.JAbstractExpandedDecoder', TypeInfo(GS300Interfaces.JAbstractExpandedDecoder));
  TRegTypes.RegisterType('GS300Interfaces.JAI01decoder', TypeInfo(GS300Interfaces.JAI01decoder));
  TRegTypes.RegisterType('GS300Interfaces.JAI01weightDecoder', TypeInfo(GS300Interfaces.JAI01weightDecoder));
  TRegTypes.RegisterType('GS300Interfaces.JAI013x0xDecoder', TypeInfo(GS300Interfaces.JAI013x0xDecoder));
  TRegTypes.RegisterType('GS300Interfaces.JAI013103decoder', TypeInfo(GS300Interfaces.JAI013103decoder));
  TRegTypes.RegisterType('GS300Interfaces.JAI01320xDecoder', TypeInfo(GS300Interfaces.JAI01320xDecoder));
  TRegTypes.RegisterType('GS300Interfaces.JAI01392xDecoder', TypeInfo(GS300Interfaces.JAI01392xDecoder));
  TRegTypes.RegisterType('GS300Interfaces.JAI01393xDecoder', TypeInfo(GS300Interfaces.JAI01393xDecoder));
  TRegTypes.RegisterType('GS300Interfaces.JAI013x0x1xDecoder', TypeInfo(GS300Interfaces.JAI013x0x1xDecoder));
  TRegTypes.RegisterType('GS300Interfaces.JAI01AndOtherAIs', TypeInfo(GS300Interfaces.JAI01AndOtherAIs));
  TRegTypes.RegisterType('GS300Interfaces.JAnyAIDecoder', TypeInfo(GS300Interfaces.JAnyAIDecoder));
  TRegTypes.RegisterType('GS300Interfaces.JBlockParsedResult', TypeInfo(GS300Interfaces.JBlockParsedResult));
  TRegTypes.RegisterType('GS300Interfaces.JCurrentParsingState', TypeInfo(GS300Interfaces.JCurrentParsingState));
  TRegTypes.RegisterType('GS300Interfaces.JCurrentParsingState_State', TypeInfo(GS300Interfaces.JCurrentParsingState_State));
  TRegTypes.RegisterType('GS300Interfaces.JDecodedObject', TypeInfo(GS300Interfaces.JDecodedObject));
  TRegTypes.RegisterType('GS300Interfaces.JDecodedChar', TypeInfo(GS300Interfaces.JDecodedChar));
  TRegTypes.RegisterType('GS300Interfaces.JDecodedInformation', TypeInfo(GS300Interfaces.JDecodedInformation));
  TRegTypes.RegisterType('GS300Interfaces.JDecodedNumeric', TypeInfo(GS300Interfaces.JDecodedNumeric));
  TRegTypes.RegisterType('GS300Interfaces.JFieldParser', TypeInfo(GS300Interfaces.JFieldParser));
  TRegTypes.RegisterType('GS300Interfaces.JFieldParser_DataLength', TypeInfo(GS300Interfaces.JFieldParser_DataLength));
  TRegTypes.RegisterType('GS300Interfaces.JGeneralAppIdDecoder', TypeInfo(GS300Interfaces.JGeneralAppIdDecoder));
  TRegTypes.RegisterType('GS300Interfaces.JPDF417Common', TypeInfo(GS300Interfaces.JPDF417Common));
  TRegTypes.RegisterType('GS300Interfaces.JPDF417Reader', TypeInfo(GS300Interfaces.JPDF417Reader));
  TRegTypes.RegisterType('GS300Interfaces.JPDF417ResultMetadata', TypeInfo(GS300Interfaces.JPDF417ResultMetadata));
  TRegTypes.RegisterType('GS300Interfaces.JPDF417Writer', TypeInfo(GS300Interfaces.JPDF417Writer));
  TRegTypes.RegisterType('GS300Interfaces.JBarcodeMetadata', TypeInfo(GS300Interfaces.JBarcodeMetadata));
  TRegTypes.RegisterType('GS300Interfaces.JBarcodeValue', TypeInfo(GS300Interfaces.JBarcodeValue));
  TRegTypes.RegisterType('GS300Interfaces.JBoundingBox', TypeInfo(GS300Interfaces.JBoundingBox));
  TRegTypes.RegisterType('GS300Interfaces.JCodeword', TypeInfo(GS300Interfaces.JCodeword));
  TRegTypes.RegisterType('GS300Interfaces.Jpdf417_decoder_DecodedBitStreamParser', TypeInfo(GS300Interfaces.Jpdf417_decoder_DecodedBitStreamParser));
  TRegTypes.RegisterType('GS300Interfaces.Jdecoder_DecodedBitStreamParser_1', TypeInfo(GS300Interfaces.Jdecoder_DecodedBitStreamParser_1));
  TRegTypes.RegisterType('GS300Interfaces.Jdecoder_DecodedBitStreamParser_Mode', TypeInfo(GS300Interfaces.Jdecoder_DecodedBitStreamParser_Mode));
  TRegTypes.RegisterType('GS300Interfaces.JDetectionResult', TypeInfo(GS300Interfaces.JDetectionResult));
  TRegTypes.RegisterType('GS300Interfaces.JDetectionResultColumn', TypeInfo(GS300Interfaces.JDetectionResultColumn));
  TRegTypes.RegisterType('GS300Interfaces.JDetectionResultRowIndicatorColumn', TypeInfo(GS300Interfaces.JDetectionResultRowIndicatorColumn));
  TRegTypes.RegisterType('GS300Interfaces.JPDF417CodewordDecoder', TypeInfo(GS300Interfaces.JPDF417CodewordDecoder));
  TRegTypes.RegisterType('GS300Interfaces.JPDF417ScanningDecoder', TypeInfo(GS300Interfaces.JPDF417ScanningDecoder));
  TRegTypes.RegisterType('GS300Interfaces.Jec_ErrorCorrection', TypeInfo(GS300Interfaces.Jec_ErrorCorrection));
  TRegTypes.RegisterType('GS300Interfaces.JModulusGF', TypeInfo(GS300Interfaces.JModulusGF));
  TRegTypes.RegisterType('GS300Interfaces.JModulusPoly', TypeInfo(GS300Interfaces.JModulusPoly));
  TRegTypes.RegisterType('GS300Interfaces.Jpdf417_detector_Detector', TypeInfo(GS300Interfaces.Jpdf417_detector_Detector));
  TRegTypes.RegisterType('GS300Interfaces.JPDF417DetectorResult', TypeInfo(GS300Interfaces.JPDF417DetectorResult));
  TRegTypes.RegisterType('GS300Interfaces.JBarcodeMatrix', TypeInfo(GS300Interfaces.JBarcodeMatrix));
  TRegTypes.RegisterType('GS300Interfaces.JBarcodeRow', TypeInfo(GS300Interfaces.JBarcodeRow));
  TRegTypes.RegisterType('GS300Interfaces.JCompaction', TypeInfo(GS300Interfaces.JCompaction));
  TRegTypes.RegisterType('GS300Interfaces.JDimensions', TypeInfo(GS300Interfaces.JDimensions));
  TRegTypes.RegisterType('GS300Interfaces.JPDF417', TypeInfo(GS300Interfaces.JPDF417));
  TRegTypes.RegisterType('GS300Interfaces.JPDF417ErrorCorrection', TypeInfo(GS300Interfaces.JPDF417ErrorCorrection));
  TRegTypes.RegisterType('GS300Interfaces.JPDF417HighLevelEncoder', TypeInfo(GS300Interfaces.JPDF417HighLevelEncoder));
  TRegTypes.RegisterType('GS300Interfaces.JPDF417HighLevelEncoder_1', TypeInfo(GS300Interfaces.JPDF417HighLevelEncoder_1));
  TRegTypes.RegisterType('GS300Interfaces.JPDF417HighLevelEncoder_NoECIInput', TypeInfo(GS300Interfaces.JPDF417HighLevelEncoder_NoECIInput));
  TRegTypes.RegisterType('GS300Interfaces.JPDF417HighLevelEncoderTestAdapter', TypeInfo(GS300Interfaces.JPDF417HighLevelEncoderTestAdapter));
  TRegTypes.RegisterType('GS300Interfaces.JQRCodeWriter', TypeInfo(GS300Interfaces.JQRCodeWriter));
  TRegTypes.RegisterType('GS300Interfaces.Jqrcode_decoder_BitMatrixParser', TypeInfo(GS300Interfaces.Jqrcode_decoder_BitMatrixParser));
  TRegTypes.RegisterType('GS300Interfaces.Jdecoder_DataBlock', TypeInfo(GS300Interfaces.Jdecoder_DataBlock));
  TRegTypes.RegisterType('GS300Interfaces.JDataMask', TypeInfo(GS300Interfaces.JDataMask));
  TRegTypes.RegisterType('GS300Interfaces.JDataMask_1', TypeInfo(GS300Interfaces.JDataMask_1));
  TRegTypes.RegisterType('GS300Interfaces.JDataMask_2', TypeInfo(GS300Interfaces.JDataMask_2));
  TRegTypes.RegisterType('GS300Interfaces.JDataMask_3', TypeInfo(GS300Interfaces.JDataMask_3));
  TRegTypes.RegisterType('GS300Interfaces.JDataMask_4', TypeInfo(GS300Interfaces.JDataMask_4));
  TRegTypes.RegisterType('GS300Interfaces.JDataMask_5', TypeInfo(GS300Interfaces.JDataMask_5));
  TRegTypes.RegisterType('GS300Interfaces.JDataMask_6', TypeInfo(GS300Interfaces.JDataMask_6));
  TRegTypes.RegisterType('GS300Interfaces.JDataMask_7', TypeInfo(GS300Interfaces.JDataMask_7));
  TRegTypes.RegisterType('GS300Interfaces.JDataMask_8', TypeInfo(GS300Interfaces.JDataMask_8));
  TRegTypes.RegisterType('GS300Interfaces.Jqrcode_decoder_DecodedBitStreamParser', TypeInfo(GS300Interfaces.Jqrcode_decoder_DecodedBitStreamParser));
  TRegTypes.RegisterType('GS300Interfaces.Jqrcode_decoder_DecodedBitStreamParser_1', TypeInfo(GS300Interfaces.Jqrcode_decoder_DecodedBitStreamParser_1));
  TRegTypes.RegisterType('GS300Interfaces.Jqrcode_decoder_Decoder', TypeInfo(GS300Interfaces.Jqrcode_decoder_Decoder));
  TRegTypes.RegisterType('GS300Interfaces.JErrorCorrectionLevel', TypeInfo(GS300Interfaces.JErrorCorrectionLevel));
  TRegTypes.RegisterType('GS300Interfaces.JFormatInformation', TypeInfo(GS300Interfaces.JFormatInformation));
  TRegTypes.RegisterType('GS300Interfaces.JMode', TypeInfo(GS300Interfaces.JMode));
  TRegTypes.RegisterType('GS300Interfaces.JQRCodeDecoderMetaData', TypeInfo(GS300Interfaces.JQRCodeDecoderMetaData));
  TRegTypes.RegisterType('GS300Interfaces.Jqrcode_decoder_Version', TypeInfo(GS300Interfaces.Jqrcode_decoder_Version));
  TRegTypes.RegisterType('GS300Interfaces.Jdecoder_Version_ECB', TypeInfo(GS300Interfaces.Jdecoder_Version_ECB));
  TRegTypes.RegisterType('GS300Interfaces.Jdecoder_Version_ECBlocks', TypeInfo(GS300Interfaces.Jdecoder_Version_ECBlocks));
  TRegTypes.RegisterType('GS300Interfaces.JAlignmentPattern', TypeInfo(GS300Interfaces.JAlignmentPattern));
  TRegTypes.RegisterType('GS300Interfaces.JAlignmentPatternFinder', TypeInfo(GS300Interfaces.JAlignmentPatternFinder));
  TRegTypes.RegisterType('GS300Interfaces.JFinderPattern', TypeInfo(GS300Interfaces.JFinderPattern));
  TRegTypes.RegisterType('GS300Interfaces.JFinderPatternFinder_1', TypeInfo(GS300Interfaces.JFinderPatternFinder_1));
  TRegTypes.RegisterType('GS300Interfaces.JFinderPatternFinder_EstimatedModuleComparator', TypeInfo(GS300Interfaces.JFinderPatternFinder_EstimatedModuleComparator));
  TRegTypes.RegisterType('GS300Interfaces.JFinderPatternInfo', TypeInfo(GS300Interfaces.JFinderPatternInfo));
  TRegTypes.RegisterType('GS300Interfaces.JBlockPair', TypeInfo(GS300Interfaces.JBlockPair));
  TRegTypes.RegisterType('GS300Interfaces.JByteMatrix', TypeInfo(GS300Interfaces.JByteMatrix));
  TRegTypes.RegisterType('GS300Interfaces.Jqrcode_encoder_Encoder', TypeInfo(GS300Interfaces.Jqrcode_encoder_Encoder));
  TRegTypes.RegisterType('GS300Interfaces.JEncoder_1', TypeInfo(GS300Interfaces.JEncoder_1));
  TRegTypes.RegisterType('GS300Interfaces.JMaskUtil', TypeInfo(GS300Interfaces.JMaskUtil));
  TRegTypes.RegisterType('GS300Interfaces.JMatrixUtil', TypeInfo(GS300Interfaces.JMatrixUtil));
  TRegTypes.RegisterType('GS300Interfaces.Jencoder_MinimalEncoder', TypeInfo(GS300Interfaces.Jencoder_MinimalEncoder));
  TRegTypes.RegisterType('GS300Interfaces.Jencoder_MinimalEncoder_1', TypeInfo(GS300Interfaces.Jencoder_MinimalEncoder_1));
  TRegTypes.RegisterType('GS300Interfaces.Jencoder_MinimalEncoder_Edge', TypeInfo(GS300Interfaces.Jencoder_MinimalEncoder_Edge));
  TRegTypes.RegisterType('GS300Interfaces.JMinimalEncoder_ResultList', TypeInfo(GS300Interfaces.JMinimalEncoder_ResultList));
  TRegTypes.RegisterType('GS300Interfaces.JResultList_ResultNode', TypeInfo(GS300Interfaces.JResultList_ResultNode));
  TRegTypes.RegisterType('GS300Interfaces.JMinimalEncoder_VersionSize', TypeInfo(GS300Interfaces.JMinimalEncoder_VersionSize));
  TRegTypes.RegisterType('GS300Interfaces.JQRCode', TypeInfo(GS300Interfaces.JQRCode));
  TRegTypes.RegisterType('GS300Interfaces.JIPrinterCallback', TypeInfo(GS300Interfaces.JIPrinterCallback));
  TRegTypes.RegisterType('GS300Interfaces.JIPrinterCallback_Stub_Proxy', TypeInfo(GS300Interfaces.JIPrinterCallback_Stub_Proxy));
  TRegTypes.RegisterType('GS300Interfaces.JIPrinterService', TypeInfo(GS300Interfaces.JIPrinterService));
  TRegTypes.RegisterType('GS300Interfaces.JIPrinterService_Stub', TypeInfo(GS300Interfaces.JIPrinterService_Stub));
  TRegTypes.RegisterType('GS300Interfaces.JIPrinterService_Stub_Proxy', TypeInfo(GS300Interfaces.JIPrinterService_Stub_Proxy));
  TRegTypes.RegisterType('GS300Interfaces.JISubLcdCallback', TypeInfo(GS300Interfaces.JISubLcdCallback));
  TRegTypes.RegisterType('GS300Interfaces.JISubLcdCallback_Stub', TypeInfo(GS300Interfaces.JISubLcdCallback_Stub));
  TRegTypes.RegisterType('GS300Interfaces.JISubLcdCallback_Stub_Proxy', TypeInfo(GS300Interfaces.JISubLcdCallback_Stub_Proxy));
  TRegTypes.RegisterType('GS300Interfaces.JISubLcdService', TypeInfo(GS300Interfaces.JISubLcdService));
  TRegTypes.RegisterType('GS300Interfaces.JISubLcdService_Stub', TypeInfo(GS300Interfaces.JISubLcdService_Stub));
  TRegTypes.RegisterType('GS300Interfaces.JISubLcdService_Stub_Proxy', TypeInfo(GS300Interfaces.JISubLcdService_Stub_Proxy));
  TRegTypes.RegisterType('GS300Interfaces.JSubLcdUtils2', TypeInfo(GS300Interfaces.JSubLcdUtils2));
  TRegTypes.RegisterType('GS300Interfaces.JSubLcdUtils2_1', TypeInfo(GS300Interfaces.JSubLcdUtils2_1));
  TRegTypes.RegisterType('GS300Interfaces.JSubLcdUtils2_2', TypeInfo(GS300Interfaces.JSubLcdUtils2_2));
  TRegTypes.RegisterType('GS300Interfaces.JSubLcdUtils2_SubLcdReceiveData', TypeInfo(GS300Interfaces.JSubLcdUtils2_SubLcdReceiveData));
  TRegTypes.RegisterType('GS300Interfaces.JSubLcdUtils2_SubLcdUtilsListener', TypeInfo(GS300Interfaces.JSubLcdUtils2_SubLcdUtilsListener));
end;

initialization
  RegisterTypes;

end.

