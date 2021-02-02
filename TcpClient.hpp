#ifndef TCPCLIENT_HPP
#define TCPCLIENT_HPP

#include <QObject>
#include <QTcpSocket>

class TcpClient : public QObject
{
    Q_OBJECT
public:
    explicit TcpClient(QObject *parent = nullptr);

signals:
    void newMessage(const QByteArray &ba);

public slots:
    void connectToServer(const QString &ip, const QString &port);
    void sendMessage(const QString &message);

private slots:
    void onConnected();
    void onReadyRead();
    void onErrorOccurred(QAbstractSocket::SocketError error);

private:
    QTcpSocket _socket;
};

#endif // TCPCLIENT_HPP
