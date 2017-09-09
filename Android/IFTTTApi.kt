
import android.content.Context
import com.android.volley.Response
import com.android.volley.toolbox.JsonObjectRequest
import com.android.volley.toolbox.Volley
import org.json.JSONObject

/**
 * Created by vlad on 9/8/17.
 */
class IFTTTApi {

    companion object {

        const val BASE_URL: String = "http://hackathon.cristi.me/api/"
        const val ADDED_TO_WISHLIST: String = "wishlist/added"
        const val ADDED_TO_CART: String = "cart/added"
        const val PURCHASE_FINISHED: String = "order/placed"

        @JvmStatic
        fun productAddedToWishList(context: Context, productJson: JSONObject, successListener:Response.Listener<JSONObject>, errorListener:Response.ErrorListener) {
            makeRequestWithVolley(context, BASE_URL + ADDED_TO_WISHLIST, productJson, successListener, errorListener)
        }

        @JvmStatic
        fun productAddedToCart(context: Context, productJson: JSONObject, successListener:Response.Listener<JSONObject>, errorListener:Response.ErrorListener) {
            makeRequestWithVolley(context, BASE_URL + ADDED_TO_CART, productJson, successListener, errorListener)
        }

        @JvmStatic
        fun purchaseFinished(context: Context, cartJson: JSONObject, successListener:Response.Listener<JSONObject>, errorListener:Response.ErrorListener) {
            makeRequestWithVolley(context, BASE_URL + PURCHASE_FINISHED, cartJson, successListener, errorListener)
        }

        private fun makeRequestWithVolley(context: Context, url: String, payload:JSONObject, successListener:Response.Listener<JSONObject>, errorListener:Response.ErrorListener) {
            val queue = Volley.newRequestQueue(context)

            val stringRequest = JsonObjectRequest(url, payload,
                    successListener, errorListener)
            queue.add(stringRequest)

        }
    }

}
