package com.fluidcrypto

import com.amazonaws.services.lambda.runtime.RequestHandler
import com.amazonaws.services.lambda.runtime.events.APIGatewayV2HTTPEvent
import com.amazonaws.services.lambda.runtime.events.APIGatewayV2HTTPResponse
import com.amazonaws.services.lambda.runtime.Context

class Handler : RequestHandler<APIGatewayV2HTTPEvent, APIGatewayV2HTTPResponse> {
    override fun handleRequest(input: APIGatewayV2HTTPEvent, context: Context): APIGatewayV2HTTPResponse {
        return APIGatewayV2HTTPResponse().apply {
            statusCode = 200
            headers = mapOf("Content-Type" to "application/json")
            body = "hello all again!this has been changed"
        }
    }
}