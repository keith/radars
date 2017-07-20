import Cocoa

final class Document: NSDocument {
    override func makeWindowControllers() {
        let windowController = NSStoryboard(name: "Main", bundle: nil)
            .instantiateController(withIdentifier: "WindowController") as! NSWindowController
        self.addWindowController(windowController)
    }

    override func canClose(withDelegate delegate: Any, shouldClose shouldCloseSelector: Selector?,
                           contextInfo: UnsafeMutableRawPointer?)
    {
        // Passing both arguments works fine as expected
//        super.canClose(withDelegate: delegate, shouldClose: shouldCloseSelector, contextInfo: contextInfo)

        // Passing nil for either the selctor, or the context crashes
        super.canClose(withDelegate: delegate, shouldClose: nil, contextInfo: contextInfo)
//        super.canClose(withDelegate: delegate, shouldClose: shouldCloseSelector, contextInfo: nil)


        // If you wanted to do anything with delegate, perhaps actually calling the selector, you'd have to
        // do something like this:
//        typealias Function = @convention(c)
//            (NSObject, Selector, NSDocument, Bool, UnsafeMutableRawPointer) -> Void
//
//        // Here you need to cast the delegate to an NSObject(Protocol), so that you can send messages to it
//        guard let selector = shouldCloseSelector, let context = contextInfo,
//            let object = delegate as? NSObject, let objcClass = objc_getClass(object.className) as? AnyClass,
//            let method = class_getMethodImplementation(objcClass, selector) else
//        {
//            super.canClose(withDelegate: delegate, shouldClose: shouldCloseSelector, contextInfo: contextInfo)
//            return
//        }
//
//        let function = unsafeBitCast(method, to: Function.self)
//        function(object, selector, self, true, context)
    }
}
