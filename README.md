# 文件传输

## 安装

```shell script
eeui plugin install https://github.com/aipaw/eeui-plugin-network
```

## 卸载

```shell script
eeui plugin uninstall https://github.com/aipaw/eeui-plugin-network
```

## 引用

```js
const network = app.requireModule("eeui/network");
```

### download(params, callback) 下载

#### 参数

1.  `url` (String)

2.  [`headers`] (Object)

3.  [`target`] (Object)

#### 返回

1.  `result` (Object)
    *   `status` (Int)

    *   `statusText` (String)

    *   `ok` (Boolean) (status `2xx`)

    *   `headers` (String)

    *   `data` (String)

    *   `progress` (Number) (status `100`)

    *   `error` (Object) (status `-1`)

#### 示例

```
networkTransfer.download('http://cdn.instapp.io/nat/samples/audio.mp3', (ret) => {
    console.log(ret)
})
```

```
networkTransfer.download({
    url: 'http://cdn.instapp.io/nat/samples/audio.mp3',
    headers: {
        'x-app': 'nat/0.0.8',
        'x-sign': 'bfbbf4c1f087d972'
    },
    target: '/instapp/nat/download'
}, (ret) => {
    console.log(ret)
})
```

* * *

### upload(params, callback) 上传

#### 参数

1.  `url` (String)

2.  `path` (String)

3.  [`method`] (String) (`POST` | `PUT` | `PATCH`, default: `POST`)

4.  [`headers`] (Object)

5.  [`name`] (String)

6.  [`formData`] (Object)

7.  [`mimeType`] (String)

#### 返回

1.  `result` (Object)
    *   `status` (Int)

    *   `statusText` (String)

    *   `ok` (Boolean) (status `2xx`)

    *   `headers` (String)

    *   `data` (String)

    *   `progress` (Number) (status `100`)

    *   `error` (Object) (status `-1`)

#### 示例

```
networkTransfer.upload({
    url:'http://uploader.示例.com',
    path: 'file:///tmp/intapp/nat/sample/localFile'
}, (ret) => {
    console.log(ret)
})
```

```
networkTransfer.upload({
    url: 'http://uploader.示例.com', 
    path: 'file:///tmp/intapp/nat/sample/localFile',
    method: 'PUT',
    formData: {
        framework: 'weex/nat'
    },
    headers: {
        'x-app': 'nat/0.0.8',
        'x-sign': 'bfbbf4c1f087d972'
    }
}, (ret) => {
    console.log(ret)
})
```

* * *

> **Error**<br/>
> DOWNLOAD_INTERNAL_ERROR<br/>
> DOWNLOAD_INVALID_ARGUMENT<br/>
> DOWNLOAD_NETWORK_ERROR<br/>
> UPLOAD_INTERNAL_ERROR<br/>
> UPLOAD_INVALID_ARGUMENT<br/>
> UPLOAD_NETWORK_ERROR
