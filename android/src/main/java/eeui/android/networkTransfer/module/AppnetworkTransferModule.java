package eeui.android.networkTransfer.module;

import com.taobao.weex.annotation.JSMethod;
import com.taobao.weex.bridge.JSCallback;
import com.taobao.weex.common.WXModule;

import java.util.HashMap;

import app.eeui.framework.extend.module.eeuiParse;
import eeui.android.networkTransfer.module.transfer.ModuleResultListener;
import eeui.android.networkTransfer.module.transfer.TransferModule;

public class AppnetworkTransferModule extends WXModule {

    @JSMethod
    public void upload(String str, final JSCallback jsCallback){
        TransferModule.getInstance().upload(str, new ModuleResultListener() {
            @Override
            public void onResult(HashMap<String, Object> o) {
                if (eeuiParse.parseInt(o.get("status")) == -1 || eeuiParse.parseInt(o.get("status")) == 200) {
                    jsCallback.invoke(o);
                }else{
                    jsCallback.invokeAndKeepAlive(o);
                }
            }
        });
    }

    @JSMethod
    public void download(String str, final JSCallback jsCallback){
        TransferModule.getInstance().download(str, new ModuleResultListener() {
            @Override
            public void onResult(HashMap<String, Object> o) {
                if (eeuiParse.parseInt(o.get("status")) == -1 || eeuiParse.parseInt(o.get("status")) == 200) {
                    jsCallback.invoke(o);
                }else{
                    jsCallback.invokeAndKeepAlive(o);
                }
            }
        });
    }
}
