package plugin.toastyplugin;
// The native Toast API
import android.widget.Toast;
// Cordova-required packages
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import android.util.Log;

public class ToastyPlugin extends CordovaPlugin {
  private static final String TAG = "myTestingApp";
  private static final String DURATION_LONG = "long";
  
  @Override
  public boolean execute(String action, JSONArray args,
    final CallbackContext callbackContext) {
      Log.d(TAG, "Java program start.");
      // Verify that the user sent a 'show' action
      if (!action.equals("show")) {
        callbackContext.error("\"" + action + "\" is not a recognized action.");
        Log.w(TAG, "" + action + " is not a recognized action.");
        return false;
      }
      String message;
      String duration;
      try {
        JSONObject options = args.getJSONObject(0);
        message = options.getString("message");
        duration = options.getString("duration");
      } catch (JSONException e) {
        callbackContext.error("Error encountered: " + e.getMessage());
        return false;
      }
      // Create the toast
      Toast toast = Toast.makeText(cordova.getActivity(), message,
        DURATION_LONG.equals(duration) ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT);
      // Display toast
      toast.show();
      // Send a positive result to the callbackContext
      PluginResult pluginResult = new PluginResult(PluginResult.Status.OK);
      callbackContext.sendPluginResult(pluginResult);
      return true;
  }
}